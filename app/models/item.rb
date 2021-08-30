class Item < ApplicationRecord
  # enum is_active: { sale: 0, sold_out: 1 }

  belongs_to :genre
  attachment :image
end
