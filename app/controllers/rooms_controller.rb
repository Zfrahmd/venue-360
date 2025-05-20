class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :destroy]

  def index
    @rooms = Room.all
  end

  def manage
    @rooms = Room.all
  end

  def new
    @room = Room.new
    @room.room_images.build
  end

  def show
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: "The room was created successfully"
    else
      redirect_back fallback_location: root_path, alert: @room.errors.full_messages.to_sentence
    end
  end

  def destroy
    if @room.destroy
      redirect_to rooms_path, notice: "Listing has been removed successfully"
    else
      redirect_to rooms_path, alert: @room.errors.full_messages.to_sentence
    end
  end

  def find_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :headline, :description, :room_number, 
                                 :room_type, :price_per_night, :capacity, :available,
                                 room_images_attributes: [:id, :image_url])
  end
end