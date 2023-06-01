class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @posts = @place.posts.where(user_id: current_user.id)
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to @place, notice: "Place created successfully."
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :description)
  end
end