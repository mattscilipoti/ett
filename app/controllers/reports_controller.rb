class ReportsController < ApplicationController
  def new
    @report = Report.with_start_time
  end
end
