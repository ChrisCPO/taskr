class TaskCompletionsController < ApplicationController

  def create
    task = Task.find(params[:id])
    task.complete!
  end
end
