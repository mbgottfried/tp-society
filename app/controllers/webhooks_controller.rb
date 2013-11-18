class WebhooksController < ApplicationController
	# You need this line or you'll get CSRF/token errors from Rails (because this is a post)
  skip_before_filter :verify_authenticity_token

  def receive
    # I like to save all my webhook events (just in case)
    # and parse them in the background
    # If you want to do that, do this
    event = Event.new({raw_body: request.body.read})
    event.save
    # OR If you'd rather just parse and act 
    # Do something like this
    raw_body = request.body.read
    json = JSON.parse raw_body
    event_type = json['type'] # You most likely need the event type
    customer_id = json['data']['object']['customer'] # Customer ID is the other main bit of info you need

    # Do the rest of your business here

    # Stripe just needs a 200/ok in return
    render nothing: true
  end
end
