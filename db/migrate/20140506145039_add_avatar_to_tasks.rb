class AddAvatarToTasks < ActiveRecord::Migration
  def change
    add_attachment :tasks, :avatar
  end
end
