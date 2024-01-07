class BookingsController < ApplicationController
    def index

        @bookings=Booking.all
    end
    
    def new
        @room = Room.find_by(id: params[:room_id])
      
        if @room
          @booking = Booking.new(room: @room)
        else
          redirect_to rooms_path, alert: 'Room not found.'
        end
      end
      
  
      def create
        @room = Room.find_by(id: params[:room_id])
        @booking = Booking.new(booking_params)
      
        if @booking.save
          redirect_to room_bookings_path(@room), notice: 'Booking was successfully created.'
        else
          flash.now[:alert] = 'Error creating booking.'
          puts @booking.errors.full_messages # This line will print errors to the console
          render :new
        end
      end
      
      
      
  
    private
  
    def booking_params
      params.require(:booking).permit(:room_id, :checkin_time, :checkout_time, guest_details: [:name, :email])
    end
  end
  