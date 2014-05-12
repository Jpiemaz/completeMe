class Task < ActiveRecord::Base
  include PublicActivity::Common

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  has_many :activities,
    as: :trackable,
    dependent: :destroy,
    class_name: "PublicActivity::Activity"

  time_for_a_boolean(:completed)
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: :default_avatar

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :user

  def self.distinct_due_dates
    where(completed_at: nil).order(due_date: :asc).pluck(:due_date).uniq
  end

  def uncompleted?
    !completed?
  end

  def due_soon?
    due_date.to_date >= Time.now.to_date &&
    Time.now.to_date > due_date.to_date - 3.days
  end

  private

  def default_avatar
    "/task_default_:style.png"
  end
end
