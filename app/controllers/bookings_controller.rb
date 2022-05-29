class BookingsController < ApplicationController
  before_action :authenticate_account!, only: %i[ index new create update destroy ]
  before_action :set_room, except: %i[index update]

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
    @booking.cost = @room.price * (@booking.endday - @booking.startday).to_i / 1.day

    if @booking.save
      redirect_to @room, notice: "Successful booking!"
    end
  end

  def update
    @booking = Booking.find(params[:booking_id])
    if @booking.room.owner.id == current_account.id
      @booking.update(status: params[:status_id])
      # redirect_to room_bookings_path(@booking.room), notice: "update successful"
    else
      redirect_to room_bookings_path(@booking.room), notice: "update failed"
    end
  end
  private
    def booking_params
      params.require(:booking).permit(:room_id, :startday, :endday)
    end

    def set_room
      @room = Room.find(params[:room_id])
    end
end
