class ReportsController < ApplicationController
  def edit
    @report = Report.find(params[:id])
  end

  def index
    @reports = Report.all
  end

  def new
    @report = Report.with_start_time
    @report.save!
    render :edit
  end

  def show
    @report = Report.find(params[:id])
  end
end
