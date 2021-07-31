class Booking < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :pet
  has_one :owner, through: :pet
end
