class Booking < ApplicationRecord
  belongs_to :room

  validates_presence_of :checkin_time, :checkout_time
  # validate :at_least_one_guest_detail_present

  before_save :update_checkout_time

  def total_guests
    guest_details.size
  end

  private

  def update_checkout_time
    update_checkout if completed?
  end

  def completed?
    checkin_time.present? && checkout_time.present? && checkout_time <= checkin_time
  end

  def create_historical_record
    HistoricalBooking.create(
      room_id: room_id,
      guest_details: guest_details,
      checkin_time: checkin_time,
      checkout_time: checkout_time
    )
  end

  def update_checkout
    Rails.logger.debug("Updating checkout - checkin_time: #{checkin_time}, checkout_time: #{checkout_time}")
    create_historical_record
    destroy
  end
# ========================
def self.ransackable_attributes(auth_object = nil)
  ["checkin_time", "checkout_time", "created_at", "guest_details", "id", "id_value", "room_id", "updated_at"]
end
# =================
def self.ransackable_associations(auth_object = nil)
  ["room"]
end

end
