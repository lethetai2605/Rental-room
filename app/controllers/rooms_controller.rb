class RoomsController < ApplicationController
  before_action :authenticate_account!, only: %i[ new create edit update destroy ]
  before_action :set_room, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
    @room.room_detail
  end

  def create
    @room = Room.new(room_params)
    @room.owner = current_account
    if @room.save
      # @room.create_room_detail
      redirect_to rooms_url, notice: "Room was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @room.update(room_params)
      redirect_to room_url(@room), notice: "Room was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_url, notice: "Room was successfully destroyed."
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :area, :address, :price, :room_type_id, 
            room_detail_attributes: [:id, :description, :bedroom, :checkin, :checkout, :startday, :endday])
    end
end
