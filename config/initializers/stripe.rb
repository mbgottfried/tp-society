  STRIPE_PUBLISHABLE_KEY = 'pk_test_ybms4ZSc8kP1FnekvyTbp7Wn'
  Stripe.api_key = 'sk_test_cgajMxpMgtzyEy4fdPKC9zzd'

  StripeEvent.setup do
    subscribe 'customer.updated' do |event|
    	user = User.find_by_stripe_id(event.data.object.id)
    	user.custup
    end
  end

  StripeEvent.setup do
    subscribe 'charge.succeeded' do |event|
    	user = User.find_by_stripe_id(event.data.object.customer)
    	user.charge_success
    end
  end