class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  has_many :likes, as: :likeable, dependent: :destroy

  validates :body, presence: true
  validates :user, presence: true
end
