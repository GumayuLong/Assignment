class JobsController < ApplicationController
  # Constant
  ELEMENT_EACH_PAGE = 5

  def index
    # Lọc theo job_type nếu có, và title nếu có
    @jobs = Job.all
    @jobs = @jobs.where(job_type: params[:job_type]) if params[:job_type].present? && Job.job_types.keys.include?(params[:job_type])
    @jobs = @jobs.where('jobs.title LIKE ?', "%#{params[:title]}%") if params[:title].present?

    # Paginate kết quả
    @jobs = @jobs.page(params[:page]).per_page(ELEMENT_EACH_PAGE)
  end

  def show
    @job = Job.find(params[:id])
  end
end
