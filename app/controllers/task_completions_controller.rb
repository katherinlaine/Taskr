class TaskCompletionsController < ApplicationController
  def create
    task = Task.find(params[:id])
    task.complete!

    redirect_to root_path
  end

  def destroy
    task = Task.find(params[:id])
    task.rewind!

    redirect_to root_path
  end
end
