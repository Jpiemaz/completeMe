class CompletionsController < ApplicationController
  def create
    @task = current_user.tasks.find(params[:task_id])
    completion = @task.create_completion(user_id: current_user.id)
    completion.create_activity(:create, owner: current_user)
    redirect_to [@task.user, :tasks]
  end

  def destroy
    @task = current_user.tasks.find(params[:task_id])
    @task.completion.destroy
    redirect_to [@task.user, :tasks]
  end
end
