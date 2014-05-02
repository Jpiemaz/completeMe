class Task < ActiveRecord::Base
  belongs_to :user

  def self.distinct_due_dates
    order(due_date: :asc).pluck(:due_date).uniq
  end
end
