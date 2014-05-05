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
end
