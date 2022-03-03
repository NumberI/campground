class Booking < ApplicationRecord
  belongs_to :campground
  belongs_to :campsite

  validates :campground_id, :campsite_id, :booked_date, presence: true
end
