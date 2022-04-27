class Food < ApplicationRecord
  belongs_to :user

  # validations
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
