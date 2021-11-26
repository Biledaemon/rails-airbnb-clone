class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
end
