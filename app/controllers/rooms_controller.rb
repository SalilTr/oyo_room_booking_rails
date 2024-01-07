class RoomsController < ApplicationController
  def index
    @rooms=Room.all
  end
  def show
    @room = Room.find_by(id: params[:id])

    if @room
      @bookings = @room.bookings
    else
      flash[:alert] = "Room not found"
      redirect_to root_path # Redirect to the root or another path as needed
    end
  end
  
    def index
      min_capacity = params[:min_capacity].to_i
      max_capacity = params[:max_capacity].to_i
  
      # Check if the conversion to integers was successful
      if min_capacity > 0 && max_capacity > 0
        @rooms = Room.where("capacity BETWEEN ? AND ?", min_capacity, max_capacity)
      else
        # Handle invalid or missing capacity parameters (you can modify this based on your requirements)
        flash[:alert] = "Invalid capacity parameters"
        @rooms = Room.all
      end
    end
  end
  