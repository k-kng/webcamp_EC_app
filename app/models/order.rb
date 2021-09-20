class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum oder_status: { unpaid: 0, deposited: 1, producing: 2, preparation: 3, sent: 4 }

  def full_address
    '〒' + postal_code + ' ' + address
  end

  def itemtotal
    total_amount - postage
  end

  def total_count
   total = 0
	 order_items.each do |order_items|
	  total += order_items.amount
	 end
	 total
	end

end
