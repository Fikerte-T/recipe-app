class User < ApplicationRecord
  has_many :foods
  has_many :recipes

  # validations
  validates :name, presence: true
end
