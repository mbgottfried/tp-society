class WebhooksController < ApplicationController  
	
	def charge_succeeded
		Easypost::Address.create(
			:name => user.name
			:street1 => user.street1
			:street2 => user.street2
			:city => user.city
			:state => user.state
			:zip => user.zip
			:country = 'USA'
			:email => user.email	
		)
	end	
end  	