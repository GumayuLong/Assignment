class JobsController < ApplicationController
  # Constant
  ELEMENT_EACH_PAGE = 5

  def index
    # Lấy tất cả jobs trong table job
    @jobs = Job.all
    # Lấy tất cả các job_type duy nhất từ bảng jobs
    @job_types = Job.distinct.pluck(:job_type)

    # Tìm kiếm theo job_types (nếu có)
    if params[:job_type].present? && Job.job_types.keys.include?(params[:job_type])
      if !params[:title].present?
        @jobs = @jobs.where(job_type: Job.job_types[params[:job_type]]).page(params[:page]).per_page(ELEMENT_EACH_PAGE)
      else
        @jobs = @jobs.where('jobs.title LIKE ? AND jobs.job_type = ?', "%#{params[:title]}%", Job.job_types[params[:job_type]]).page(params[:page]).per_page(ELEMENT_EACH_PAGE)
      end
    else
      if params[:title].present?
        @jobs = @jobs.where('jobs.title LIKE ?', "%#{params[:title]}%").page(params[:page]).per_page(ELEMENT_EACH_PAGE)
      else
        @jobs = Job.paginate(page: params[:page], per_page: ELEMENT_EACH_PAGE)
      end
    end
  end

  def show
    @job = Job.find(params[:id])
  end
end
