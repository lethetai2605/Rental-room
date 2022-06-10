# frozen_string_literal: true

class RoomDetailsController < ApplicationController
  before_action :authenticate_account!, only: %i[new create edit update destroy]
  before_action :set_room, only: %i[show create edit update destroy]

  def show
    @room_detail = @room.room_detail
  end

  def new
    @room_detail = RoomDetail.new
  end

  def create
    @room_detail = @room.build_room_detail(room_detail_params)
    if @room_detail.save
      redirect_to @room
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @room_detail = @room.room_detail
  end

  def update; end

  def destroy; end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def room_detail_params
    params.require(:room_detail).permit(:checkin, :checkout, :startday, :endday, :description, :bedroom)
  end
end
