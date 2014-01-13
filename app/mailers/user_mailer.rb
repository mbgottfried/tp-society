class UserMailer < ActionMailer::Base
  default from: "concierge@toiletpapersociety.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
 
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Toilet Paper Society Password Reset"
  end

  def welcome_mailer(user)
    @user = user
    mandrill_mail template: 'toilet-paper-society-welcome'
    mail :to => user.email, :subject => "Welcome to the Society!"
  end

  def customer_updated(user)
    @user = user
    mail :to => user.email, :subject => "Account Updated"
  end

  def charge_failed(user)
    @user = user
    mail :to => user.email, :subject => "Please Update Your Billing Information"
  end

  def subscription_deleted(user)
    @user = user
    mail :to => user.email, :subject => "Sorry to see you go :("
  end

  def admin_mailer(user)
    @user = user
    mail :to => "mike@eastmontgroup.com", :subject => "New Customer Signup"
  end

end
