# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
csv_file = File.read('./sample_campground_data.csv')
csv = CSV.parse(csv_file, headers: true)
csv.each do |row|
  hh = row.to_hash.symbolize_keys
  campground = Campground.find_or_create_by(name: hh[:campground_name])
  campground.update(campsites_attributes: [{name: hh[:campsite_name], price: hh[:price_usd]}])  
end
