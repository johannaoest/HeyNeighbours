class JobsController < ApplicationController

  before_action :set_job, only: %i[show destroy edit update confirm]
  skip_before_action :authenticate_user!, only: :index

  def index

    if params[:my_jobs]
      @jobs = policy_scope(Job).where(user: current_user).order(created_at: :desc)
    else
      @jobs = policy_scope(Job).bookings_not_confirmed.or(policy_scope(Job).without_bookings)
      if params['filter']
        @distance = params['filter']['distance']
        @jobs = @jobs.where.not(user: current_user).near(current_user.address, params['filter']['distance'].to_i).order(created_at: :desc)
      else
        @jobs = @jobs.where.not(user: current_user).order(created_at: :desc)
      end
    end


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
      redirect_to jobs_path(my_jobs: true)
    else
      render 'new'
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path(my_jobs: true)
  end

  def update
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  def confirm
    @booking = Booking.find(params[:booking_id])
    @booking.update(pending: true)
    @job.update(job_params)
    authorize @job
    redirect_to jobs_path(my_jobs: true)
  end

  def edit
  end

  def show
    @chatroom = Chatroom.find_by(sender: current_user, recipient: @job.user)
  end

  private

  def set_job
    @job = Job.find(params[:id])
    authorize @job
  end

  def job_params
    params.require(:job).permit(:title, :details, :location, :date, :duration, :price, :rating, :category, :photo)
  end
end
