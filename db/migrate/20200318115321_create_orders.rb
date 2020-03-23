class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.date :delivery_date
      t.decimal :total_amount, precision: 10, scale: 6

      t.timestamps
    end
  end
end
