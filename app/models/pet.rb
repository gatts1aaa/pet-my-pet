class Pet < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings
  has_many :customers, -> { distinct }, through: :bookings
  has_many_attached :photos
end
