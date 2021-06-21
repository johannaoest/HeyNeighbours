class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy confirmation]
  def show
  end

  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
  end
 
  def destroy

    authorize @booking
    @job = @booking.job
    @booking.destroy

    redirect_to applyments_index_path(@job)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.job = Job.find(params[:job_id])
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to job_path(@booking.job)
    else
      render 'new'
    end
  end

  def applyments
    @job = Job.find(params[:job_id])
    @bookings = Booking.where(job: @job)
    authorize @job
  end

  def confirmation
    authorize @booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
