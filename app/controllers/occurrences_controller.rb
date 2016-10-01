class OccurrencesController < ApplicationController
  def create
    @report = Report.find(params[:report_id])

    if occurrence_params[:task_id]
      @occurrence = @report.occurrences.create!(occurrence_params)
    else
      task = @report.tasks.where(task_params).first || Task.create!(task_params)
      @occurrence = @report.occurrences.create!(occurrence_params.merge(task: task))
    end

    if @occurrence.save
      flash[:success] = "Saved"
    else
      flash[:error] = "Issue saving"
    end

    redirect_to edit_report_url(@report)
  end

  def destroy
    @occurrence = Occurrence.find(params[:id]).destroy
    report = @occurrence.report
    flash[:success] = "Occurrence deleted"
    redirect_to edit_report_url(report)
  end

  private

  def occurrence_params
    params.require(:occurrence).permit(:started_at, :task_id)
  end

  def task_params
    params.require(:task).permit(:task_id)
  end

end
