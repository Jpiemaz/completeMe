class HomesController < ApplicationController
  before_action :goto_activities

  def show
  end

  def goto_activities
    if signed_in?
      redirect_to activities_path
    end
  end
end
