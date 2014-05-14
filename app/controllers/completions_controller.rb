class CompletionsController < ApplicationController
  def create
    @task = current_user.tasks.find(params[:task_id])
    completion = @task.create_completion
    redirect_to [@task.user, :tasks]
  end

  def destroy
    @task = current_user.tasks.find(params[:task_id])
    @task.completion.destroy
    redirect_to [@task.user, :tasks]
  end
end
