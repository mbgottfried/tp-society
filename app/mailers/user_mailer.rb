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
    mail :to => user.email, :subject => "Welcome to the Society!"
  end

end
