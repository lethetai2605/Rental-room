class RoomDetailsController < ApplicationController
  before_action :authenticate_account!, only: %i[ new create edit update destroy ]
  before_action :set_room, only: %i[ show edit update destroy ]

  def show
    @room_detail = @room.room_detail
  end

  def new
    @room = Room.find(params[:room_id])
    @room_detail = RoomDetail.new
  end

  def create
    @room_detail = @room.room_details.create(room_detail_params)
    if @room_detail.save
      redirect_to @room 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @room_detail = @room.room_detail
  end

  def update
    
  end

  def destroy
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    def room_detail_params
      params.require(:room_detail).permit(:checkin, :checkout, :startday, :endday, :description, :bedroom)
    end


end
