class AddMaxCapacityToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :max_capacity, :integer
  end
end
