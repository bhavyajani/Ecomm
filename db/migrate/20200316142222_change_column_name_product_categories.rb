class ChangeColumnNameProductCategories < ActiveRecord::Migration[5.1]
  def change
    rename_column :product_categories, :Name, :name
    rename_column :product_categories, :Description, :description
  end
end
