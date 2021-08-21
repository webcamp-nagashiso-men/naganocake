class CartProduct < ApplicationRecord
  belongs_to :end_user
  belongs_to :product

  def add_tax_subtotal
    (self.product.price * self.quantity * 1.08).round
    #消費税計算をここで定義
  end

  def self.sum_price #sumは複数だけで使える
    sum = 0 #sumを定義と初期化 初期化しないとsum = nillとなって足し算の時エラーになる
    #binding.pry
    self.all.each do |cart_product|
      sum += cart_product.add_tax_subtotal #sum = sum + cart_product.add_tax_subtotal
    end
    return sum
  end


end
