module TasksHelper
  def week_day_due(task)
    Date::DAYNAMES[task.due_date.wday]
  end

  def calendar_day_due(task)
    task.due_date.strftime("%B #{task.due_date.day.ordinalize}, %Y")
  end

  def date_completed(task)
    task.completed_at.strftime("%B #{task.completed_at.day.ordinalize}, %Y")
  end

  def pretty_due_date(due_date)
    if Time.now.to_date == due_date.to_date
      "Today"
    elsif Time.now < due_date && due_date < Time.now + 1.weeks
      Date::DAYNAMES[due_date.wday]
    else
      due_date.strftime("%B #{due_date.day.ordinalize}, %Y")
    end
  end
end
