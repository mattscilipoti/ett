class ReportsController < ApplicationController

  def destroy
    report = Report.find(params[:id]).destroy
    flash[:warning] = "Report deleted successfully (#{report.started_at}, id: #{report.id})."
    redirect_to reports_url(report)
  end

  def edit
    @report = Report.find(params[:id])
  end

  def index
    @reports = Report.all
  end

  def new
    @report = Report.with_start_time
    render :edit
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to reports_url
    else
      render 'edit'
    end
  end


  private

  def report_params
    params.require(:report).permit(:duration_human, :occurrence_duration_human)
  end

end
