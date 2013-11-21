  STRIPE_PUBLISHABLE_KEY = 'pk_test_ybms4ZSc8kP1FnekvyTbp7Wn'
  Stripe.api_key = 'sk_test_cgajMxpMgtzyEy4fdPKC9zzd'

require 'easypost'
EasyPost.api_key = 'KCt9J7ZWaxjY01LgHSDs0A'

  StripeEvent.setup do
    subscribe 'customer.updated' do |event|
    	user = User.find_by_stripe_id(event.data.object.id)
    	user.custup
    end
  end

  StripeEvent.setup do
    subscribe 'charge.succeeded' do |event|
    	user = User.find_by_stripe_id(event.data.object.customer)
        order.new_shipment
    end
  end

  StripeEvent.setup do
    subscribe 'charge.failed' do |event|
      user = User.find_by_stripe_id(event.data.object.customer)
      user.chargefail
    end
  end

  StripeEvent.setup do
    subscribe 'customer.subscription.deleted' do |event|
      user = User.find_by_stripe_id(event.data.object.customer)
      user.subdel
    end
  end