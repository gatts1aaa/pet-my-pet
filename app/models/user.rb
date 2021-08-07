class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :own_pets, foreign_key: 'owner_id', class_name: 'Pet'
  has_many :owner_bookings, through: :own_pets, source: :bookings
  has_many :customer_bookings, foreign_key: 'customer_id', class_name: 'Booking'
  has_many :customer_pets, -> { distinct }, through: :customer_bookings, source: :pet
  has_one_attached :photo
end
