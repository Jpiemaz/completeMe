class TasksController < ApplicationController
  def index
    @user = find_user
    @tasks = @user.tasks
    @distinct_due_dates = @tasks.distinct_due_dates
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
end
