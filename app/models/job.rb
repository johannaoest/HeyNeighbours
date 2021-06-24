class Job < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :price, numericality: { greater_than_or_equal: 0 }
  validates :duration, presence: true

  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  scope :without_bookings, -> { includes(:bookings).where( bookings: {job_id: nil}) }
  scope :bookings_not_confirmed, -> { includes(:bookings).where(bookings: { confirmed: false }) }

  monetize :price_cents

  def self.category
    ["Please choose one", "Animal Care", "Child Care", "Construction", "Education", "Grocery", "Gardening", "Housekeeping", "Technology", "Logistics", "Manufacturing", "Others"]
  end

  def self.duration
    ["15 minutes", "30 minutes", "45 minutes", "1 hour", "1.5 hour", "2 hours", "2.5 hours", "3 hours", "3.5 hours", "4 hours"]
  end
end
