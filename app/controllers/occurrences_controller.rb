class OccurrencesController < ApplicationController
  def create
    if occurrence_params[:task_id].present?
      @occurrence = Occurrence.create!(occurrence_params)
    else
      task = Task.where(task_params).first_or_create
      @occurrence = task.occurrences.create!(occurrence_params)
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
    flash[:warning] = "Occurrence deleted successfully."
    redirect_to edit_report_url(report)
  end

  private

  def occurrence_params
    params.require(:occurrence).permit(:started_at, :task_id)
  end

  def task_params
    params.require(:task).permit(:name)
  end

end
