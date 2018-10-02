class TasksController < ApplicationController
  private
    def task_params
      params.require(:name).permit(:content, :duedate)
    end
end
