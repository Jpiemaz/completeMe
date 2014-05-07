class CommentLikesController < ApplicationController
  def create
    @comment = Comment.find(params[:id])
    current_user.like @comment
    render :change
  end

  def destroy
    @comment = Comment.find(params[:id])
    current_user.unlike @comment
    render :change
  end
end
