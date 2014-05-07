class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :likeable_id
      t.string :likeable_type
      t.integer :user_id

      t.timestamps
    end
    add_index :likes, [:likeable_id, :likeable_type]
    add_index :likes, :user_id
  end
end
