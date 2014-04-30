class User < ActiveRecord::Base
  include Clearance::User
  has_many :tasks
  has_attached_file :avatar, default_url: :default_avatar
  validates_attachment :avatar,
    content_type: {content_type: "/\Aimage\/.*\Z/"}

  private

  def default_avatar
    "/default-avatar.png"
  end
end
