class TasksController < ApplicationController
  def show
    @task = Task.find_by_hash_id(params[:id])
  end

  def index
    @tasks = current_user.tasks.all
  end
  def new
    @task = current_user.tasks.build
  end
  def create
    @task = current_user.tasks.build(task_params)
    if (@task.save)
      flash[:success] = "Task created!"
      redirect_to @task
    else
      render 'new'
    end
  end
  private
    def task_params
      params.require(:task).permit(:name, :description, :duedate)
    end
end
