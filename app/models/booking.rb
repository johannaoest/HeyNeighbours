class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :job

  has_many :reviews, dependent: :destroy
  after_update :booking_selection

  def booking_selection
    if self.confirmed == true
      self.job.bookings.where(confirmed: false).destroy_all
    end
  end
end
