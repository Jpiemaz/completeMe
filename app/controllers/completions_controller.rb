class CompletionsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    completion = @task.create_completion
    redirect_to [@task.user, :tasks]
  end

  def update
    @task = Task.find(params[:task_id])
    @task.completion.destroy
    redirect_to [@task.user, :tasks]
  end
end
