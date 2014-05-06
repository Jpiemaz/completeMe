class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.new(comment_params)
    if @comment.save
    else
      redirect_to @task
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).
      permit(:body).
      merge(user_id: current_user.id)
  end
end
