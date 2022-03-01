# README

1. Implement a RESTful API that will be used to manage campground availability and
pricing
2. The models must contain the following:
  a. Campground
    i. name: every Campground has a name
    ii. campsites: each Campground requires a minimum of one associated campsite
    iii. booked_dates: Campgrounds can derive a list of booked dates from their associated Campsites
    iv. price_range: Campground derive a price range from their associated Campsite
  b. Campsite
    i. name: every Campsite has a name
    ii. campground: every Campsite is associated with a Campground
    iii. booked_dates: each Campsite keeps track of which nights it is booked
    iv. price: each Campsite has a single price per night
3. You may implement additional models to support the Campground and Campsite if you
see fit.
4. Attached to this challenge you should have received a CSV with campground data to
seed the database. Implement a means of loading this data. There doesn’t have to be
an API endpoint for this, a console based solution is perfectly acceptable.
5. The API must implement all CRUD methods for all models
6. The API must have an endpoint that returns a list of Campgrounds that are available on
a specific date range.
7. API must have an endpoint that returns a list of Campgrounds ordered by price, both low
to high, and high to low.
# campground-app
