class JobsController < ApplicationController
  before_action :set_job, only: %i[show destroy edit update]
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
      redirect_to job_path(@job)
    else
      render 'new'
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  def update
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  def edit
  end

  def show
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(job).permit(:title, :details, :location, :date, :duration, :price, :rating)
  end
end
