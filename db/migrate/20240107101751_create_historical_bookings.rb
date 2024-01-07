class CreateHistoricalBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :historical_bookings do |t|
     
      t.json :guest_details
      t.datetime :checkin_time
      t.datetime :checkout_time
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
