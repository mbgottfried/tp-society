  STRIPE_PUBLISHABLE_KEY = 'pk_test_ybms4ZSc8kP1FnekvyTbp7Wn'
  Stripe.api_key = 'sk_test_cgajMxpMgtzyEy4fdPKC9zzd'

  StripeEvent.setup do
    subscribe 'charge.succeeded' do |event|
    	@user = current_user
    	@user.update_attributes(most_recent_charge: Time.now)
    end

  end