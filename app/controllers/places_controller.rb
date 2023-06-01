class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    # Render new place form
  end

 	
  def create
    place = Place.new(place_params)
    place.user = @current_user
    if place.save
      redirect_to places_path
    else
      render :new
    end
end

  private

  def place_params
    params.require(:place).permit(:name, :description)
  end
end

