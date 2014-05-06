class Task < ActiveRecord::Base
  has_many :comments
  time_for_a_boolean(:completed)
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :user

  def self.distinct_due_dates
    where(completed_at: nil).order(due_date: :asc).pluck(:due_date).uniq
  end

  def uncompleted?
    !completed?
  end
end
