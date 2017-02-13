class JobsController < ApplicationController
  def index
    if params[:sort] == "location"
      sort_location_query
    elsif params[:sort] == "interest"
      sort_interest_query
    elsif params[:location]
      location_city_query
    else
      company_jobs
    end
  end

  def sort_location_query
    @jobs = Job.all.sort_by(&:city)
    @filter = "location"
    @topic = "listed by city"
  end

  def sort_interest_query
    @jobs = Job.all.sort_by(&:level_of_interest)
    @filter = "interest"
    @topic = "listed by level of interest"
  end

  def location_city_query
    @jobs = Job.where(city: params[:location])
    param1 = params[:location]
    @topic = "in #{params[:location]}"
  end

  def company_jobs
    @jobs = Job.all
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new
    @contact.company_id = @company.id
    @topic = "for #{@company.name}"
  end

  def homepage
  end

  def dashboard
    @jobs_by_interest = Job.sort_by_interest
    @top_companies = Job.sort_jobs_by_company
    @jobs_by_city = Job.sort_jobs_by_city
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new
    @contact = Contact.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
    @comment = Comment.new
  end

  def edit
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def update
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
    @job.update(job_params)
    if @company.save
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    company = Company.find(params[:company_id])
    job.destroy

    redirect_to company_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
