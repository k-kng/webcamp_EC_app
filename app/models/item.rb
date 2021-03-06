class Item < ApplicationRecord

  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  attachment :image

  def add_tax_price
    (self.price * 1.1).round
  end

end
