class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom # chatroom_1 (it is basically generating a unique channel)
    # stream_for "general"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
