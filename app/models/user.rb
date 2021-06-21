class User < ApplicationRecord
  has_many :jobs
  has_many :reviews
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  has_one_attached :avatar
end
