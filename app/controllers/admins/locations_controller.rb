class Admins::LocationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @location = Location.new
    @locations = Location.all
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to admins_locations_path
    else
      @locations = Location.all
      @location = Location.new
      render :index
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    location  = Location.find(params[:id])
    location.update(location_params)
    redirect_to admins_locations_path
  end

  private
  def location_params
    params.require(:location).permit(:name)
  end

end
