module TasksHelper
  def week_day_due(task)
    Date::DAYNAMES[task.due_date.wday]
  end

  def calendar_day_due(task)
    task.due_date.strftime("%B #{task.due_date.day.ordinalize}, %Y")
  end
end
