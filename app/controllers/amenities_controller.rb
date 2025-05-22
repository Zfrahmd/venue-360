# app/controllers/amenities_controller.rb
class AmenitiesController < ApplicationController
  before_action :set_amenity, only: [:show, :edit, :update, :destroy]

  def index
    @amenities = Amenity.all
  end

  def show
  end

  def new
    @amenity = Amenity.new
  end

  def edit
  end

  def create
    @amenity = Amenity.new(amenity_params)

    if @amenity.save
      redirect_to @amenity, notice: 'Amenity was successfully created.'
    else
      render :new
    end
  end

  def update
    if @amenity.update(amenity_params)
      redirect_to @amenity, notice: 'Amenity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @amenity.destroy
    redirect_to amenities_path notice: 'Amenity was successfully deleted.'
  end

  private

  def set_amenity
    @amenity = Amenity.find(params[:id])
  end

  def amenity_params
    params.require(:amenity).permit(:name, :description, :icon_class)
  end
end