class AddCartEmptyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_cart_empty, :boolean, default: true
  end
end
