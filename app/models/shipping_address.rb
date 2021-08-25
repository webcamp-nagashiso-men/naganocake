class ShippingAddress < ApplicationRecord
    
    belongs_to :end_user
    
    validates :end_user_id, :name, :address, presence: true
	  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
	
end
