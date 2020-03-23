class AddUnitPriceToOrderDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :order_details, :unit_price, :decimal, precision: 10, scale: 6
    add_column :order_details, :sub_total, :decimal, precision: 10, scale: 6
  end
end
