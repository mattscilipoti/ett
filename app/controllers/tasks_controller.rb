class TasksController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    @task = report.tasks.build(task_params)
    if @task.save
      redirect_to report
    else
      render "new"
    end
  end

  def index
    @tasks = Task.all
  end

  # def new
  #   @task = Task.new
  # end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
