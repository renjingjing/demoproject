class AddProducerReferencesToAvatar < ActiveRecord::Migration
  def change
    add_reference :avatars, :producer, index: true, foreign_key: true
  end
end
