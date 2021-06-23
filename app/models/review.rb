class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewed_user, class_name: "User"
  belongs_to :booking
end
