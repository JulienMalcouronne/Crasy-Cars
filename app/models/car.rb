class Car < ApplicationRecord
  has_one_attached :photo
  has_many :reservations
  belongs_to :user
end
