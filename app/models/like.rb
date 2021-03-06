class Like < ActiveRecord::Base
  include PublicActivity::Common

  has_many :activities,
    as: :trackable,
    dependent: :destroy,
    class_name: "PublicActivity::Activity"

  belongs_to :likeable, polymorphic: true
  belongs_to :user

  def liker
    user
  end

  def likeable_user
    likeable.user
  end
end
