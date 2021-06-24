# To deliver this notification:
#
# MessageNotification.with(post: @post).deliver_later(current_user)
# MessageNotification.with(post: @post).deliver(current_user)

class MessageNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database

  def to_database
    {
      type: self.class.name,
      params: params
    }
  end

  # Add required params
  #
  param :message

  def message
    message = Message.find(params[:message])
    if message.present?
      "You have a new message from #{message.user.email}!"
    else
      "You have a new message"
    end
  end

  def url
    message = Message.find(params[:message])
    chatroom_path(message.chatroom)
  end
end
