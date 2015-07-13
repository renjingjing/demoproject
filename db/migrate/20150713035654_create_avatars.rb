class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :title
      t.references :imageable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
