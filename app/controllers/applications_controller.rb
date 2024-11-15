class ApplicationsController < ApplicationController
  before_action :set_job

  def new
    @application = @job.applications.build
  end

  def create
    unless @job
      flash[:alert] = 'Job not found.'
      redirect_to jobs_path
      return
    end

    @application = @job.applications.build(application_params)
    if @application.save
      @application.send_application_email
      flash[:notice] = 'Your application has been submitted successfully!'
      redirect_to @job
    else
      render :new
    end
  end

  private
    def set_job
      @job = Job.find(params[:job_id])
    end

    def application_params
      params.require(:application).permit(:application_name, :application_email, :application_birthday, :application_gender)
    end
end
