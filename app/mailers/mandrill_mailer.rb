class UserMailer < MandrillMailer::TemplateMailer
  default from: 'conceirge@toiletpapersociety.com'

  def welcome_mailer(user)
    mandrill_mail template: 'Toilet Paper Society - Welcome'
    @user = user
    mail :to => user.email, :subject => "Welcome to the Society!"
  end

end