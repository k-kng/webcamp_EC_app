class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :payment_method, default: 0
      t.integer :postage, default: 800
      t.integer :total_amount
      t.integer :oder_status, default: 0

      t.timestamps
    end
  end
end
