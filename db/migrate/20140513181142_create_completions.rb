class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.belongs_to :task, null: false

      t.timestamps
    end
  end
end
