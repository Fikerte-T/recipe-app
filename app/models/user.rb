class User < ApplicationRecord
  has_many :foods, dependent: :destroy

  # validations
  validates :name, presence: true
end
