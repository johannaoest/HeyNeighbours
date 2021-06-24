class ChatroomsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @chatroom = Chatroom.new(name: @booking.job.title, recipient_id: @booking.job.user.id, sender_id: current_user.id)
    authorize @chatroom
    @chatroom.save

    redirect_to chatroom_path(@chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
  end

  def index
    @chatrooms = policy_scope(Chatroom).where(recipient: current_user).or(policy_scope(Chatroom).where(sender: current_user))
    @message = Message.new
  end
end
