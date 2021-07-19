class CreateOrderDitails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_ditails do |t|
      t.integer :order_id
      t.integer :item_id
      t.decimal :price
      t.integer :amount
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
