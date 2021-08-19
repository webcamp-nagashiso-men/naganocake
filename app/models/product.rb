class Product < ApplicationRecord
  attachment :image
  
  validates :name, presence: true
  validates :guide, presence: true
  validates :price, presence: true
  
end

