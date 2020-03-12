class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.string :Name
      t.text :Description

      t.timestamps
    end
  end
end
