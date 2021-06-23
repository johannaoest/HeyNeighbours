class ChatroomsController < ApplicationController
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
