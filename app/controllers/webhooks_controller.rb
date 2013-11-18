class WebhooksController < ApplicationController  
	StripeEvent.setup do
    subscribe 'customer.updated' do |event|
    	user = User.find_by_stripe_id(event.data.object.customer)
    	user.most_recent_charge = DateTime.new
    end

  end
end  	