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

  def update
    task = Task.find(params[:id])
    set_completed_param_to_boolean
    task.update(task_params)
    redirect_to [task.user, :tasks]
  end

  private

  def find_user
    User.find(params[:user_id])
  end

  def set_completed_param_to_boolean
    if params[:task][:completed] == '0'
      params[:task][:completed] = false
    elsif params[:task][:completed] == '1'
      params[:task][:completed] = true
    end
  end

  def task_params
    params.require(:task).
      permit(:name, :description, :due_date, :completed)
  end
end
