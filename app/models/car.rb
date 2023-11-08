class Car < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :model, presence: true

  has_many :reservations, dependent: :destroy

  belongs_to :user
  belongs_to :city
end
