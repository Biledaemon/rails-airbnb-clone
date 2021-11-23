class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :user, :car, presence: true
end
