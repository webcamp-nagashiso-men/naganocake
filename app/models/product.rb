class Product < ApplicationRecord
  attachment :image

  def add_tax_price
    (self.price + 1.08).round
    #消費税計算をここで定義
  end

end

