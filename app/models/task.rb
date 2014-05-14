class Task < ActiveRecord::Base
  include PublicActivity::Common

  has_many :comments, dependent: :destroy
  has_one :image, dependent: :destroy
  has_one :completion, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  has_many :activities,
    as: :trackable,
    dependent: :destroy,
    class_name: "PublicActivity::Activity"

  belongs_to :user

  def self.distinct_due_dates
    joins("LEFT JOIN completions ON completions.task_id = tasks.id").
      where(completions: { task_id: nil }).
      order(due_date: :asc).pluck(:due_date).uniq
  end

  def due_soon?
    due_in_three_days &&
      due_today_or_future
  end

  def complete?
    completion.present?
  end

  def uncomplete?
    completion.blank?
  end

  def find_completion
    completion || Completion.new
  end

  private

  def due_in_three_days
    Date.today >= (due_date - 3.days)
  end

  def due_today_or_future
    due_date.future? || due_date.today?
  end
end
