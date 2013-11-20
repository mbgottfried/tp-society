class AddLabelToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :label, :string
  end
end
