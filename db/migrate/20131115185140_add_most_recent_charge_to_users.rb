class AddMostRecentChargeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :most_recent_charge, :datetime
  end
end
