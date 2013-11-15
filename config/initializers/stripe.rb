  STRIPE_PUBLISHABLE_KEY = 'pk_test_ybms4ZSc8kP1FnekvyTbp7Wn'
  Stripe.api_key = 'sk_test_cgajMxpMgtzyEy4fdPKC9zzd'

  StripeEvent.setup do
  	subscribe 'customer.updated' do |event|
  		post '/admin' do
		# Retrieve the request's body and parse it as JSON
  		event_json = JSON.parse(request.body.read)

    end
  end