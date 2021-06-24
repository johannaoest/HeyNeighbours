class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  after_commit :deliver_notification

  def deliver_notification
    notification = ReviewNotification.with(review: self.id)
    notification.deliver(self.user)
  end

end
