class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]
  def show
  end

  def index
    @bookings = Booking.where(user: current_user)
  end

  def destroy
    @booking.destroy

    redirect_to bookings_path
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.job = Job.find(params[:job_id])
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(booking).require(:user, :job)
  end
end
