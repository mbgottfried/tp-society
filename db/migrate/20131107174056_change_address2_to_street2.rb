class ChangeAddress2ToStreet2 < ActiveRecord::Migration
  def up
  	rename_column :users, :address2, :street2
  end

  def down
  	rename_column :users, :street1, :address2
  end
end
