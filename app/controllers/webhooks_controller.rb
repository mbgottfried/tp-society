class WebhooksController < ApplicationController

	def self.charge_succeeded
	to_address = EasyPost::Address.create(
			:name => 'Michael Gottfried',
			:street1 => '2795 Peachtree Road',
			:street2 => 'Unit 805',
			:city => 'Atlanta',
			:state => 'GA',
			:zip => '30305',
			:country => 'USA',
			:email => 'michael.b.gottfried@gmail.com'	
		)
	from_address = EasyPost::Address.create(
			:company => 'Eastmont Group',
			:street1 => '1425 Ellsworth Industrial Blvd',
			:street2 => 'Suite 7',
			:city => 'Atlanta',
			:state => 'GA',
			:zip => '30318',
			:phone => '404-937-6554'
		)

	parcel = EasyPost::Parcel.create(
			:width => 15.2,
			:length => 18,
			:height => 9.5,
			:weight => 35.1
		)

	shipment = EasyPost::Shipment.create(
			:to_address => to_address,
			:from_address => from_address,
			:parcel => parcel
		)
	shipment.buy(
  			:rate => shipment.lowest_rate
		)		

		puts shipment.postage_label.label_url
	end	
end  	