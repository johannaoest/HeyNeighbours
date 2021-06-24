class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  after_commit :deliver_notification

  def deliver_notification
    notification = MessageNotification.with(message: self.id)
    notification.deliver(self.chatroom.recipient)
  end
end
