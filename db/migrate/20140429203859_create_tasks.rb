class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.text :description
      t.date :due_date, null: false
      t.boolean :complete

      t.timestamps
    end
  add_index :tasks, :name
  end
end
