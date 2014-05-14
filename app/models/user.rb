class User < ActiveRecord::Base
  include Clearance::User
  has_merit
  has_many :merit_notifications, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :liked_tasks,
    through: :tasks,
    source: :likeable,
    source_type: 'Task',
    dependent: :destroy

  has_many :liked_comments,
    through: :comments,
    source: :likeable,
    source_type: 'Comment',
    dependent: :destroy

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship",
    dependent: :destroy

  has_many :followed_users,
    through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship",
    dependent: :destroy

  has_many :followers,
    through: :follower_relationships

  has_many :tasks, dependent: :destroy

  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: :default_avatar

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.search(search_params)
    query = search_params[:query]
    where("name ILIKE :query OR email ILIKE :query", query: "%#{query}%")
  end

  def follow(other_user)
    followed_user_relationships.create(followed_user: other_user)
  end

  def unfollow(other_user)
    followed_users.destroy(other_user)
  end

  def following?(other_user)
    followed_user_ids.include? other_user.id
  end

  def like(target)
    like = likes.create(likeable: target)
  end

  def liked?(target)
    likes.exists?(likeable: target)
  end

  def unlike(target)
    like = likes.find_by(likeable: target)
    like.destroy
  end

  def name
    super || email
  end

  def latest_merit_notification
    merit_notification.last
  end

  private

  def default_avatar
    "/default_:style.png"
  end
end
