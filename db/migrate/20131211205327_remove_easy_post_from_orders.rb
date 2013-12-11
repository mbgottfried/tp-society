class RemoveEasyPostFromOrders < ActiveRecord::Migration
  def up
  	remove_column :orders, :label
  	remove_column :orders, :shipment_id
  end

  def down
  end
end
