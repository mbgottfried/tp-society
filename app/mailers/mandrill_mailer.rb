class MandrillMailer < MandrillMailer::TemplateMailer
  default from: 'conceirge@toiletpapersociety.com'

  def welcome_mailer(user)
    @user = user
    mandrill_mail template: 'toilet-paper-society-welcome'
    mail :to => user.email, :subject => "Welcome to the Society!"
  end

end