class Comment < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :user
  belongs_to :task
  has_many :likes, as: :likeable, dependent: :destroy

  has_many :activities,
    as: :trackable,
    dependent: :destroy,
    class_name: "PublicActivity::Activity"

  validates :body, presence: true
  validates :user, presence: true

  def commenter
    user
  end

  def commented_task_user
    task.user
  end
end
