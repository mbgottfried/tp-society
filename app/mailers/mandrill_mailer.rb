class TransactionMailer < MandrillMailer::TemplateMailer
  default from: 'conceirge@toiletpapersociety.com'

  def mandrill_welcome(user)
    @user = user
    mandrill_mail template: 'Toilet Paper Society - Welcome',
    to: user.email, 
    subject: "Welcome to the Society!"
  end

end