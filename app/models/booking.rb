class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :job

  has_many :reviews, dependent: :destroy
end
