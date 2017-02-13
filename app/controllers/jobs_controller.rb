class JobsController < ApplicationController
  def index
    if params[:sort] == "location"
      @jobs = Job.all.sort_by(&:city)
      @filter = "location"
      @topic = "listed by city"
    elsif params[:sort] == "interest"
      @jobs = Job.all.sort_by(&:level_of_interest)
      @filter = "interest"
      @topic = "listed by level of interest"
    elsif params[:location] != nil
      @jobs = Job.where(city: params[:location])
      @topic = "in #{params[:location]}"
    else
      @jobs = Job.all
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
      @contact = Contact.new
      @contact.company_id = @company.id
      @topic = "for #{@company.name}"
    end
  end

  def dashboard
    @jobs_by_interest = Job.all.group(:level_of_interest).count.sort.to_h
    sort_jobs_by_company
  end

  def sort_jobs_by_company
    by_company = Job.all.group(:company_id).average(:level_of_interest)
    no_bigdecimal = by_company.inject({}) { |h, (k,v)| h[k] = v.floor; h }
    top_three = no_bigdecimal.first(3).to_h
    @top_companies = top_three.map do |k, v|
      "#{Company.find(k).name}(#{v})"
    end
    sort_jobs_by_city
  end

  def sort_jobs_by_city
    @by_city = Job.all.group(:city).count.sort.to_h
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
