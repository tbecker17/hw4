class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    place = Place.new(place_params)
    place.user = @current_user
    if place.save
      redirect_to "/places"
    else
      render :new
    end

    def show
      @place = Place.find(params[:id])
    end
end

  private

  def place_params
    params.require(:place).permit(:name, :description)
  end
end

