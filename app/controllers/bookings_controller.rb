class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy create_confirmation check_confirmation confirm]
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
      create_chat
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def applyments
    @job = Job.find(params[:job_id])
    @bookings = Booking.where(job: @job)
    authorize @job
  end

  def create_confirmation
    @job = @booking.job
    authorize @booking
  end

  def check_confirmation
    authorize @booking
  end

  def confirm
    authorize @booking

    @booking.update(confirmed: true, pending: false)

    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def create_chat
    chatroom = Chatroom.new(name: @booking.job.title, recipient_id: @booking.job.user.id, sender_id: current_user.id)
    chatroom.save
  end
end
