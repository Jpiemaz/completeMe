class ImagesController < ApplicationController
  def edit
    @task = Task.find(params[:task_id])
  end

  def new
    @task = Task.find(params[:task_id])
    @image = Image.new
  end

  def create
    task = Task.find(params[:task_id])
    image = task.create_image(image_params)
    redirect_to task
  end

  def update
    task = Task.find(params[:task_id])
    image = task.image
    image.update(image_params)
    redirect_to [task.user, :tasks]
  end

  private

  def image_params
    params.require(:image).permit(:avatar)
  end
end
