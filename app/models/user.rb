class User < ActiveRecord::Base
  include Clearance::User
  has_attached_file :avatar, default_url: :default_avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
