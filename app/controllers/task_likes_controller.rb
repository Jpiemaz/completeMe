class TaskLikesController < ApplicationController
  def create
    @task = Task.find(params[:id])
    current_user.like @task
    render :change
  end

  def destroy
    @task = Task.find(params[:id])
    current_user.unlike @task
    render :change
  end
end
