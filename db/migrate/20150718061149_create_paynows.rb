class CreatePaynows < ActiveRecord::Migration
  def change
    create_table :paynows do |t|
      t.float :amount
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.string :stripe_txn_id
      t.string :aasm_state

      t.timestamps null: false
    end
  end
end
