class AddDetailsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price, :decimal, precision: 10, scale: 6
    add_column :products, :in_stock, :boolean, default: true
  end
end
