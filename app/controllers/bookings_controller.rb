class BookingsController < ApplicationController
  before_action :authenticate_account!, only: %i[ index new create update destroy ]
  before_action :set_room, except: %i[index]

  def index
    if params[:room_id]
      @bookings = Booking.where(room_id: params[:room_id])
    else
      @bookings = Booking.where(account_id: current_account)
    end
  end

  def create
    @booking = @room.bookings.build(booking_params)
    @booking.guest = current_account

    if @booking.save
      redirect_to @room, notice: "Successful booking!"
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:room_id)
    end

    def set_room
      @room = Room.find(params[:room_id])
    end
end
