class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :booked_date
      t.references :campground, null: false, foreign_key: true
      t.references :campsite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
