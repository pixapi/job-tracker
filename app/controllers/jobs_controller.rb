class JobsController < ApplicationController
  def index
    @jobs, @filter, @topic = QuerySelector.new(params).set_values
  end

  def homepage
  end

  def dashboard
    @jobs_by_interest = Job.sort_by_interest
    @top_companies = Job.sort_jobs_by_company
    @jobs_by_city = Job.sort_jobs_by_city
  end
end
