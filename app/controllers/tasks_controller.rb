class TasksController < ApplicationController
  def index
    @user = find_user
    @tasks = @user.tasks
    @distinct_due_dates = @tasks.distinct_due_dates
  end

  def show
    @task = find_task
    @comment = Comment.new
    @comments = @task.comments
  end

  def new
    @task = Task.new
  end

  def create
    @user = find_user
    @task = @user.tasks.new(task_params)
    if @task.save
      @task.create_activity(:create, owner: current_user)
      redirect_to [@user, :tasks]
    else
      render :new
    end
  end

  def edit
    @task = find_task
  end

  def update
    task = find_task
    set_completed_param_to_boolean
    task.update(task_params)
    if task.completed?
      task.create_activity(:completed, owner: current_user)
    end
    redirect_to [task.user, :tasks]
  end

  def destroy
    task = find_task
    task.destroy
    redirect_to [task.user, :tasks]
  end

  private

  def find_task
    Task.find(params[:id])
  end

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
      permit(:name, :description, :due_date, :completed, :avatar)
  end
end
