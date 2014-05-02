class TasksController < ApplicationController
  def index
    @user = find_user
    @tasks = @user.tasks
    @due_dates = due_dates
  end

  def new
    @task = Task.new
  end

  def create
    @user = find_user
    @task = @user.tasks.new(task_params)
    if @task.save
      redirect_to [@user, :tasks]
    else
      render :new
    end
  end

  private

  def find_user
    User.find(params[:user_id])
  end

  def task_params
    params.require(:task).
      permit(:name, :description, :due_date)
  end

  def due_dates
    user = find_user
    tasks = user.tasks
    due_dates = []
    tasks.each do |task|
      due_dates << task.due_date
    end
    due_dates.uniq.sort
  end
end
