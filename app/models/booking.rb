class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :review
end
