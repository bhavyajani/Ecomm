class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :Name, :name
    rename_column :products, :Description, :description
  end
end
