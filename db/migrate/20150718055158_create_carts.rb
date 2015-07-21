class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.float :payment
      t.string :note
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.string :stripe_txn_id
      t.string :aasm_state

      t.timestamps null: false
    end
  end
end
