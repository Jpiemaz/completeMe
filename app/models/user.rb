class User < ActiveRecord::Base
  include Clearance::User

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"

  has_many :followed_users,
    through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship"

  has_many :followers,
    through: :follower_relationships

  has_many :tasks
  has_attached_file :avatar, default_url: :default_avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def follow(other_user)
    followed_user_relationships.create(followed_user: other_user)
  end

  def unfollow(other_user)
    followed_users.destroy(other_user)
  end

  def following?(other_user)
    followed_user_ids.include? other_user.id
  end

  private

  def default_avatar
    "/default-avatar.png"
  end
end
