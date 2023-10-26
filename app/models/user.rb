class User < ApplicationRecord
  validates :name, presence: true

  has_many :cars
  has_many :reservations
end
