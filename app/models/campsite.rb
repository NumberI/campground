class Campsite < ApplicationRecord
  has_many :bookings
  belongs_to :campground

  accepts_nested_attributes_for :campground
  after_create :set_campground_price

  def set_campground_price
    campground.set_price(self.price)
  end
end
