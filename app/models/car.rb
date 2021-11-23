class Car < ApplicationRecord
  belongs_to :user

  validates :car, presence: true
  validates :brand, presence: true
  validates :model, presence: true
end
