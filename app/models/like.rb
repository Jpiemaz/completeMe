class Like < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :likeable, polymorphic: true
  belongs_to :user
end
