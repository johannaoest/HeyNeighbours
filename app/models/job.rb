class Job < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :price, numericality: { greater_than_or_equal: 0 }
  validates :duration, numericality: { greater_than_or_equal: 0 }

  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
