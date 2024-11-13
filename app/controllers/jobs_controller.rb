class JobsController < ApplicationController
  # Constant
  ELEMENT_EACH_PAGE = 10

  def index
    # @job_types = Job.job_type.keys
    @jobs = Job.all
    @jobs = Job.paginate(page: params[:page], per_page: ELEMENT_EACH_PAGE)
  end

  def show
    @job = Job.find(params[:id])
  end
end
