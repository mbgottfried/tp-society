class WebhooksController < ApplicationController
	# You need this line or you'll get CSRF/token errors from Rails (because this is a post)
  skip_before_filter :verify_authenticity_token

  def receive
    # I like to save all my webhook events (just in case)
    # and parse them in the background
    # If you want to do that, do this
    event = Event.new({raw_body: request.body.read})
    event.save
    
    # Do the rest of your business here

    # Stripe just needs a 200/ok in return
    render nothing: true
  end
end
