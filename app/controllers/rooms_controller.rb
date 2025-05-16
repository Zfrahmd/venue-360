class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    # byebug
    @room = @room.assign_attributes(room_params)
    @room.room_images.build
    if @room.save
        redirect_back fallback_location: root_path, notice: "The room was created successfully"
    else
      redirect_back fallback_location: root_path, alert: @room.errors.full_messages.to_sentence
    end
  end

  def room_params
    params.require(:room).permit(:name, :headline, :description, :room_number, 
                                 :room_type, :price_per_night, :capacity, :available,
                                 room_images_attributes: [:image_url])
  end
end