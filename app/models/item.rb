class Item < ApplicationRecord

  belongs_to :genre
  attachment :image

  def add_tax_price
    (self.price * 1.1).round
  end

end
