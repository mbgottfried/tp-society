class Order < ActiveRecord::Base
  attr_accessible :status, :user_id, :label, :shipment_id

  belongs_to :user

  def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  		csv << column_names
  		all.each do |order|
  			csv << order.attributes.values_at(*column_names)
  		end
  	end
  end
end