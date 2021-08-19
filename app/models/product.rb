class Product < ApplicationRecord
  belongs_to :genre
  attachment :image


  validates :name, presence: true
  validates :guide, presence: true
  validates :price, presence: true

  def add_tax_price
    (self.price + 1.08).round
    #消費税計算をここで定義
  end

end

