class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.belongs_to :task, index: true, null: false
      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end
