class Reservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :user
  belongs_to :car
  belongs_to :city
end
