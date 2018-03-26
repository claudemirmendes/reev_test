class ReportsController < ApplicationController
  def generate_reports
  	reports = Survivor.generate_reports

  	render json: reports
  end
end
