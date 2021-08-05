class Pet < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings
  has_many :customers, -> { distinct }, through: :bookings
  has_many_attached :photos

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
