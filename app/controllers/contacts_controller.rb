class ContactsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    # @job = Job.find(params[:job_id])
    @comment.job_id = @job.id
    @contact = Contact.new
    @contact.company_id = @company.id
  end

  def create
    @contact = Contact.new(contact_params)
    @company = Company.find(params[:company_id])
    @contact.company_id = @company.id
    @contact.save
    # byebug

    redirect_to company_jobs_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :e_mail)
  end

end
