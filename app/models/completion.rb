class Completion < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :task

  has_many :activities,
    as: :trackable,
    dependent: :destroy,
    class_name: "PublicActivity::Activity"
end
