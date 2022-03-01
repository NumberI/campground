class Campground < ApplicationRecord
  has_many :bookings
  has_many :campsites

  accepts_nested_attributes_for :campsites
  validates_uniqueness_of :name

  attribute :price_range, :string
  attribute :booked_dates, :string


  def price_range
    min_price..max_price
  end

  def booked_dates
    bookings.pluck(:book_date).join(', ')
  end

  def set_price(price)
    update(min_price: price) if min_price.nil? || price < min_price
    update(max_price: price) if max_price.nil? || price > max_price
  end
end
