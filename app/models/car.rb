class Car < ApplicationRecord
  belongs_to :user

  validates :brand, presence: true
  validates :model, presence: true
end
