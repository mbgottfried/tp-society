class AddOrderDateToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :order_placed, :datetime
  end
end
