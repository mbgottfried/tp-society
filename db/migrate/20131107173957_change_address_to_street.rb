class ChangeAddressToStreet < ActiveRecord::Migration
  def up
  	rename_column :users, :address, :street1
  end

  def down
  	rename_column :users, :street1, :address
  end
end
