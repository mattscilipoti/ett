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
end
