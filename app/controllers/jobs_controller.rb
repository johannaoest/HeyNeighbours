class JobsController < ApplicationController
  before_action :set_job, only: %i[show destroy edit update]
  def index

    if params[:my_jobs]
      @jobs = policy_scope(Job).where(user: current_user).order(created_at: :desc)
    else
      if params['filter']
        @jobs = policy_scope(Job).where.not(user: current_user).near(current_user.address, params['filter']['distance'].to_i).order(created_at: :desc)
      else
        @jobs = policy_scope(Job).where.not(user: current_user).order(created_at: :desc)
      end
    end


    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    # @jobs = Job.where.not(latitude: nil, longitude: nil)
    @markers = @jobs.geocoded.map do |job|
      {
        lat: job.latitude,
        lng: job.longitude,
        info_window: render_to_string(partial: "/jobs/info_window", locals: { job: job })
      }
    end
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    authorize @job

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
    authorize @job
  end

  def job_params
    params.require(:job).permit(:title, :details, :location, :date, :duration, :price, :rating, :category)
  end
end
