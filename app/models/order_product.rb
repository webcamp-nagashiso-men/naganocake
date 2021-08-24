class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  enum make_status: {"製作不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}

   def add_tax_price
    (self.product.price * 1.1).round
    #商品の合計金閣
   end

  def add_tax_subtotal
    (self.product.price * self.quantity * 1.1).round
    #商品×個数の合計金額
  end

  def self.sum_price #sumは複数だけで使える
    sum = 0 #sumを定義と初期化 初期化しないとsum = nillとなって足し算の時エラーになる
    #binding.pry
    self.all.each do |cart_product|
      sum += cart_product.add_tax_subtotal #sum = sum + cart_product.add_tax_subtotal
    end
    return sum #全てのカート内商品の合計金額
  end

end
