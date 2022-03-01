module Queries
  class CampgroundCollectionQuery
    def initialize(options = {})
      p '[' * 100, options
      @date_range = options[:date_range]
      @sorting = options[:sorting] || 'asc'
    end

    def self.call(...)
      new(...).call
    end

    def call
      collection
    end

    private

    def collection
      campgrounds = if @date_range.present?
        Campground.eager_load(:bookings)
                    .where.not("(bookings.booked_date BETWEEN ? AND ?) AND bookings.id IS NOT NULL", 
                    formatted_date_range[0], formatted_date_range[1] )
        
      else
        Campground.all
      end
      if @sorting == 'asc'
        campgrounds.order(min_price: :asc)
      else
        campgrounds.order(max_price: :desc)
      end
    end

    def formatted_date_range
      @date_range.split('..').map(&:to_date)
    end
  end
end