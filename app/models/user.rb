class User < ApplicationRecord
  has_many :jobs
  has_many :reviews
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  has_many :outgoing_chatrooms, :class_name => 'Chatroom', :foreign_key => 'sender_id'
  has_many :incoming_chatrooms, :class_name => 'Chatroom', :foreign_key => 'recipient_id'
  has_many :my_reviews, class_name: "Review", foreign_key: "reviewed_user_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  has_one_attached :avatar
end
