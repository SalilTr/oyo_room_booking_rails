class AddDetailsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :guest_details, :json
    add_column :bookings, :checkin_time, :datetime
    add_column :bookings, :checkout_time, :datetime
  end
end
