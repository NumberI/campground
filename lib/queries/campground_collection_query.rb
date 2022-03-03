module Queries
  class CampgroundCollectionQuery
    
    class WrongFormatError < StandardError; end

    def initialize(options = {})
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
        first_range, last_range = format_date_range
        Campsite.includes(:campground)
                .eager_load(:bookings)
                .where.not("(bookings.booked_date BETWEEN ? AND ?) AND bookings.id IS NOT NULL",
                first_range,
                last_range)
                .group(:campground_id)
                .map(&:campground)
      else
        Campground.all
      end

      if @sorting == 'asc'
        campgrounds.sort_by {|x| x.min_price}
      else
        campgrounds.sort_by {|x| x.max_price}.reverse!
      end
    end

    def format_date_range
      pattern = /\d+\.\d+\.\d+\.\.\d+\.\d+\.\d+/
      raise WrongFormatError, 'bad date range format', [] unless pattern.match?(@date_range)
      
      @date_range.split('..').map(&:to_date)
    end
  end
end
