class Task < ActiveRecord::Base
  belongs_to :user

  def week_day_due
    Date::DAYNAMES[self.due_date.wday]
  end

  def calendar_day_due
    due_date.strftime("%B #{self.due_date.day.ordinalize}, %Y")
  end
end
