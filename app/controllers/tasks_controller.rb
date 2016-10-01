class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url
    else
      render 'new'
    end
  end

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      flash[:success] = "Task ('#{task.name}', id:#{task.id}) was destroyed."
    else
      flash[:error] = "Issue destroying task (#{task.id}: #{task.name})."
    end
    redirect_to tasks_url
  end

  def edit
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_url
    else
      render 'edit'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
