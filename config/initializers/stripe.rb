  STRIPE_PUBLISHABLE_KEY = 'pk_test_ybms4ZSc8kP1FnekvyTbp7Wn'
  Stripe.api_key = 'sk_test_cgajMxpMgtzyEy4fdPKC9zzd'

  StripeEvent.setup do
  	subscribe 'customer.updated' do |event|
  		user = User.find_by_customer_id(event.data.object.customer)
  		user.update_attributes(most_recent_charge: Date.today.to_s)
  		user.save
    end
  end