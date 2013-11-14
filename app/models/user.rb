class User < ActiveRecord::Base
  before_save { self.email = email.downcase } 

  attr_accessible :name, :email, :password, :password_confirmation, :stripe_token, :last_4_digits, :street1, :street2, :city, :state, :zip, :subscribed

  attr_accessor :password, :stripe_token
  before_save :encrypt_password
  before_save :update_stripe

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

  validates_presence_of :last_4_digits
  validates_presence_of :street1
  validates_presence_of :city

  validates :name, presence: true, length: { maximum: 50 }
  validates :state, presence: true, length: { maximum: 2 }
  validates :zip, presence: true, length: { maximum: 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def stripe_description
    "#{name}: #{email}"
  end

  def stripe_address
    "#{street1}, #{street2}, #{city}, #{state} #{zip}"
  end

  def update_stripe
    if stripe_id.nil?
      if !stripe_token.present?
        raise "We're doing something wrong -- this isn't supposed to happen"
      end

      customer = Stripe::Customer.create(
        :email => email,
        :description => stripe_description,
        :card => stripe_token,
        :metadata => {'Shipping Address' => stripe_address}
      )
      self.last_4_digits = customer.cards.data.first.last4
      response = customer.update_subscription({:plan => "premium"})
      self.subscribed = true
    else
      customer = Stripe::Customer.retrieve(stripe_id)

      if stripe_token.present?
        customer.card = stripe_token
      end

      # in case they've changed
      customer.email = email
      customer.description = stripe_description
      customer.metadata = {'Shipping Address' => stripe_address}

      customer.save

      self.last_4_digits = customer.cards.data.first.last4
    end

    self.stripe_id = customer.id
    self.stripe_token = nil
  end

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && BCrypt::Password.new(user.hashed_password) == password
      user
    else
      nil
    end
  end


  def encrypt_password
    if password.present?
      self.hashed_password = BCrypt::Password.create(password)
    end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end