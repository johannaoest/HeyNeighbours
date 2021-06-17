class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]
  def show
  end

  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
  end
 
  def destroy
    @booking.destroy

    redirect_to bookings_path
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

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
