class Room < ApplicationRecord
    has_many :bookings
  
    scope :available_for_booking, ->(guests_count) { where('max_capacity >= ?', guests_count) }
    def self.ransackable_associations(auth_object = nil)
      ["bookings"]
    end
    # ========================
    def self.ransackable_attributes(auth_object = nil)
      ["capacity", "created_at", "id", "id_value", "max_capacity", "name", "price", "updated_at"]
    end
  end
  