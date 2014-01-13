class TransactionMailer < MandrillMailer::TemplateMailer
  default from: 'conceirge@toiletpapersociety.com'

  def mandrill_welcome(user)
    mandrill_mail template: 'Toilet Paper Society - Welcome'
    @user = user
    mail :to => user.email, :subject => "Welcome to the Society!"
  end

end