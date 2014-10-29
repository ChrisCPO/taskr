class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
    @new_task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params).order(created_at: :desc)

    if @task.save
      redirect_to root_path
    else 
      render :back
    end
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
