class FollowingRelationship < ActiveRecord::Base
  include PublicActivity::Common

  has_many :activities,
    as: :trackable,
    dependent: :destroy,
    class_name: "PublicActivity::Activity"

  belongs_to :followed_user, class_name: "User"
  belongs_to :follower, class_name: "User"
end
