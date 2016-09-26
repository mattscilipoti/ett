class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new
    @report = Report.with_start_time
  end

  def show
    @report = Report.find(params[:id])
  end
end
