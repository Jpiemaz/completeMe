class ProfilesController < ApplicationController
  def show
    @user = find_user
  end

  def edit
    @user = find_user
  end

  def update
    user = find_user
    user.update(user_params)
    redirect_to [user, :profile]
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :about,
      :avatar
    )
  end

  def find_user
    User.find(params[:user_id])
  end
end
