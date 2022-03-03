# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Queries::CampgroundCollectionQuery do
  context :queries do
    before(:all) do 
      campground = Campground.create(name: "Cove Campground", campsites_attributes: [{name: '01', price: 35.0}, {name: '02', price: 33.0}])
      Campground.create(name: "Boundary Creek Campground", campsites_attributes: [{name: '009', price: 17.0}, {name: '013', price: 13.0}])
      campground.bookings.create(campsite_id: campground.campsites.first.id, booked_date: '02.03.2022'.to_date)
      campground.bookings.create(campsite_id: campground.campsites.second.id, booked_date: '04.03.2022'.to_date)
    end
    
    let(:date_range_1) {'01.03.2022..03.03.2022'}
    let(:date_range_2) {'01.03.2022..04.03.2022'}

    it 'without params' do
      object = Queries::CampgroundCollectionQuery.new
      expect(object.call.first.id).to  eq(2)
    end
    
    it 'with date_range_1' do
      object = Queries::CampgroundCollectionQuery.new(date_range: date_range_1)
      expect(object.call.count).to  eq(2)
    end
    
    it 'with date_range_2' do
      object = Queries::CampgroundCollectionQuery.new(date_range: date_range_2)
      expect(object.call.count).to  eq(1)
    end
  end
end
