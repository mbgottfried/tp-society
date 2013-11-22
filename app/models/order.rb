class Order < ActiveRecord::Base
  attr_accessible :status, :user_id, :label, :shipment_id

  belongs_to :user
end