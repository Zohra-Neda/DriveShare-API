class Car < ApplicationRecord
    validates :name, presence: true
    validates :image, presence: true
    validates :description, presence: true
    validates :available, presence: true

    belongs_to :user
    belongs_to :city
end
