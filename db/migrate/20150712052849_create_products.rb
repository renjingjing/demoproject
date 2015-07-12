class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :sku
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
