class Booking < ApplicationRecord
  belongs_to :campground
  belongs_to :campsite

  validates :booked_date, presence: true
end
