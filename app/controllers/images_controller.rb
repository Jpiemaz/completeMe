class ImagesController < ApplicationController
  def edit
    @task = find_task
  end

  def new
    @task = find_task
    @image = Image.new
  end

  def create
    task = find_task
    image = task.create_image(image_params)
    image.create_activity(:create, owner: current_user)
    redirect_to [task.user, :tasks]
  end

  def update
    task = find_task
    image = task.image
    image.update(image_params)
    redirect_to [task.user, :tasks]
  end

  private

  def find_task
    Task.find(params[:task_id])
  end

  def image_params
    params.require(:image).
      permit(:avatar).
      merge(user_id: current_user.id)
  end
end
