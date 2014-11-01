class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      render @task
    else
      render partial: "application/form_errors", locals: {object: @task}, status: 422
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head 200
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
