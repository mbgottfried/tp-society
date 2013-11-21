class Order < ActiveRecord::Base
  attr_accessible :status

  belongs_to :user

  def new_shipment
    @order = Order.new(params[:order])
    @order.status = "Order Placed"
    @order.user_id = user.id
    @order.label = shipment.postage_label.label_url
    @order.shipment_id = shipment.id
    @order.save
  end
end