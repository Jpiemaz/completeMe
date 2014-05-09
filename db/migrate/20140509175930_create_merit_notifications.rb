class CreateMeritNotifications < ActiveRecord::Migration
  def change
    create_table :merit_notifications do |t|
      t.integer :user_id
      t.string :description
      t.string :reason
      t.datetime :time

      t.timestamps
    end
  end
end
