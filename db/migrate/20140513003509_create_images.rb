class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :task, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.attachment :avatar
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
