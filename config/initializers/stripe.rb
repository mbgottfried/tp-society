  STRIPE_PUBLISHABLE_KEY = ENV['STRIPE_PUBLISHABLE_KEY']
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']

#require 'easypost'
#EasyPost.api_key = 'KCt9J7ZWaxjY01LgHSDs0A'

  StripeEvent.setup do 
    subscribe 'customer.subscription.created' |event|
      user = User.find_by_stripe_id(event.data.object.customer)
      user.subcreate
    end
  end

  StripeEvent.setup do
    subscribe 'customer.updated' do |event|
    	user = User.find_by_stripe_id(event.data.object.id)
    	user.custup
    end
  end

 StripeEvent.setup do
    subscribe 'charge.succeeded' do |event|
    	user = User.find_by_stripe_id(event.data.object.customer)

#        to_address = EasyPost::Address.create(
#            :name => user.name,
#            :street1 => user.street1,
#            :street2 => user.street2,
#            :city => user.city,
#            :state => user.state,
#            :zip => user.zip,
#            :country => 'USA',
#            :email => user.email
#          )
#       from_address = EasyPost::Address.create(
#            :company => 'Eastmont Group',
#            :street1 => '1425 Ellsworth Industrial Blvd',
#            :street2 => 'Suite 7',
#            :city => 'Atlanta',
#            :state => 'GA',
#            :zip => '30318',
#            :phone => '404-937-6554'
#          )

#        parcel = EasyPost::Parcel.create(
#            :width => 15.2,
#            :length => 18,
#            :height => 9.5,
#            :weight => 35.1
#          )

#        shipment = EasyPost::Shipment.create(
#            :to_address => to_address,
#            :from_address => from_address,
#            :parcel => parcel
#          )
#        shipment.buy(
#              :rate => shipment.lowest_rate
#          )   

#          puts shipment.postage_label.label_url
#          puts shipment.id

         order = Order.create(
           :status => "Order Placed",
           :user_id => user.id,
           :order_placed => DateTime.now.to_date,
           :name => user.name,
           :street1 => user.street1,
           :street2 => user.street2,
           :city => user.city,
           :state => user.state,
           :zip => user.zip
           #:label => shipment.postage_label.label_url,
           #:shipment_id => shipment.id
           )

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