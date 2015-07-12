class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :address1
      t.string :address2
      t.string :note

      t.timestamps null: false
    end
  end
end
