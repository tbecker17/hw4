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
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.save
    redirect_to "/places"
  end

  private

  def place_params
    params.require(:place).permit(:name, :description)
  end
end