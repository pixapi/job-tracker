class CommentsController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @company = Company.find(params[:company_id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def create
    @comment = Comment.new(comment_params)
    @job = Job.find(params[:job_id])
    @comment.job_id = params[:job_id]

    @comment.save

    redirect_to company_job_path(@job.company_id, @job.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
