class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum task_status: { pending: 0, waiting: 1, working: 2, completed: 3 }

  def subtotal
    sub_total * amount
  end

  def item_subtotal
    item.add_tax_price * amount
  end
  

end
