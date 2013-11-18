  STRIPE_PUBLISHABLE_KEY = 'pk_test_ybms4ZSc8kP1FnekvyTbp7Wn'
  Stripe.api_key = 'sk_test_cgajMxpMgtzyEy4fdPKC9zzd'

  StripeEvent.setup do
    subscribe 'charge.succeeded' do |event|
    	@user = User.find(User.find_by_stripe_customer_token(data['data']['object']['customer']).user)
    	@user.most_recent_charge = DateTime.new
    	@user.save
    end

  end