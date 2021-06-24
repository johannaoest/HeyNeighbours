class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :job

  has_many :reviews, dependent: :destroy
  after_update :booking_selection
  after_create :deliver_notification

  def deliver_notification
    notification = BookingNotification.with(job: self.job.id)
    notification.deliver(self.job.user)
  end

  def booking_selection
    if self.confirmed == true
      self.job.bookings.where(confirmed: false).destroy_all
    end
  end
end
