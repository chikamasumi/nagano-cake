class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :cart_item_id
      t.integer :payment_method
      t.decimal :payment
      t.decimal :shipping
      t.string :postal_code
      t.string :address
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
