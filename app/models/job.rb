class Job < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :price, numericality: { greater_than_or_equal: 0 }
  validates :duration, numericality: { greater_than_or_equal: 0 }
end
