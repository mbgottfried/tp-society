class Order < ActiveRecord::Base
  attr_accessible :status

  belongs_to :user

  def new_shipment
  	to_address = EasyPost::Address.create(
            :name => user.name,
            :street1 => user.street1,
            :street2 => user.street2,
            :city => user.city,
            :state => user.state,
            :zip => user.zip,
            :country => 'USA',
            :email => user.email
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
          puts shipment.id

          @order = order.new
          @order.status = "Order Placed"
          @order.user_id = user.id
          @order.label = shipment.postage_label.label_url
          @order.shipment_id = shipment.id
          @order.save
  end
end