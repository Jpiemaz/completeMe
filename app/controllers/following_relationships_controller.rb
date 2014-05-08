class FollowingRelationshipsController < ApplicationController
  def create
    followed_user = find_user
    following_relationship = current_user.follow(followed_user)
    following_relationship.create_activity(:create, owner: current_user)
    redirect_to [followed_user, :profile]
  end

  def destroy
    followed_user = find_user
    current_user.unfollow(followed_user)
    redirect_to [followed_user, :profile]
  end

  private

  def find_user
    User.find(params[:id])
  end
end
