class Job < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :price, numericality: { greater_than_or_equal: 0 }
  validates :duration, numericality: { greater_than_or_equal: 0 }

  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def self.category
    ["Please choose one", "Animal Care", "Child Care", "Construction", "Education", "Grocery", "Gardening", "Housekeeping", "Technology", "Logistics", "Manufacturing", "Others"]
  end
end
