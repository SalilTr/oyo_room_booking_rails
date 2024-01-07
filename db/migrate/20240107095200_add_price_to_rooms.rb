class AddPriceToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :price, :decimal
  end
end
