class CommentLikesController < ApplicationController
  def create
    @comment = Comment.find(params[:id])
    current_user.like @comment
    @comment.create_activity :like, owner: current_user
    render :change
  end

  def destroy
    @comment = Comment.find(params[:id])
    current_user.unlike @comment
    render :change
  end
end
