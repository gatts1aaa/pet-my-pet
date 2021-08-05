class Booking < ApplicationRecord
  belongs_to :customer, class_name: 'User'#, counter_cache: true,
  belongs_to :pet
  has_one :owner, through: :pet

  #validates :start_date, :end_date, presence: true, availability: true
  #validate :end_date_after_start_date

  def booked_date_range
    { from: :start_date, to: :end_date }
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "doit être après la date de début")
    end
 end
end

#class Booking < ApplicationRecord
#  belongs_to :customer, class_name: 'User'
#  belongs_to :pet
#  has_one :owner, through: :pet
#end
