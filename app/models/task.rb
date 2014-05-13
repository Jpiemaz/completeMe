class Task < ActiveRecord::Base
  include PublicActivity::Common

  has_many :comments, dependent: :destroy
  has_one :image, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  has_many :activities,
    as: :trackable,
    dependent: :destroy,
    class_name: "PublicActivity::Activity"

  time_for_a_boolean(:completed)

  belongs_to :user

  def self.distinct_due_dates
    where(completed_at: nil).order(due_date: :asc).pluck(:due_date).uniq
  end

  def uncompleted?
    !completed?
  end

  def due_soon?
    due_in_three_days &&
      due_today_or_future
  end

  private

  def due_in_three_days
    Date.today >= (due_date - 3.days)
  end

  def due_today_or_future
    due_date.future? || due_date.today?
  end
end
