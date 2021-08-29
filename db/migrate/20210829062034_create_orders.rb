class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.string :payment
      t.integer :_method
      t.integer :postage
      t.integer :total_amount
      t.integer :oder_status

      t.timestamps
    end
  end
end
