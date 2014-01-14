class TransactionMailer < MandrillMailer::TemplateMailer
  default from: 'conceirge@toiletpapersociety.com'

  def mandrill_welcome(user)
    @user = user
    mandrill_mail template: 'Toilet Paper Society - Welcome',
    to: user.email, 
    subject: "Welcome to the Society!"
  end

  def mandrill_update(user)
  	@user = user
  	mandrill_mail template: 'Account Update',
  	to: user.email,
  	subject: "Account Updated"
  end

  def mandrill_failed(user)
  	@user = user
  	mandrill_mail template: 'Charge Failed',
  	to: user.email,
  	subject: "Please Update Your Account"
  end

  def mandrill_cancel(user)
  	@user = user
  	mandrill_mail template: 'Subscription Cancelled',
  	to: user.email,
  	subject: "We're Sorry To See You Go"
  end

  def mandrill_create(user)
    @user = user
    mandrill_mail template: 'Subscription Created',
    to: 'mike@eastmontgroup.com,justin@eastmontgroup.com,mark@eastmontgroup.com,williamhwatts@gmail.com',
    subject: "New Customer"
  end

end