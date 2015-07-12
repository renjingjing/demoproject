class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :name
      t.string :information

      t.timestamps null: false
    end
  end
end
