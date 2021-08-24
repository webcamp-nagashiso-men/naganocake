class Product < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :cart_products, dependent: :destroy

  belongs_to :genre
  attachment :image


  validates :name, :guide, :price, :genre_id, presence: true
  validates :price, numericality: { only_integer: true }

  def add_tax_price
    (self.price * 1.1).round
    #消費税計算をここで定義
  end

  def self.search(word) #今回の場合selfにproductを代入して使う
    if word.present?
      Product.where(['name LIKE ?', "%#{word}%"]) #whereは完全一致 LIKE ? を書くことで部分一致なども使えるようになる
    else
      Product.all
    end
  end

end

