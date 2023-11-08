class CitiesController < ApplicationController
  # GET /cities or /cities.json
  def index
    @cities = City.all

    render json: @cities
  end

  # POST /cities or /cities.json
  def create
    @city = City.new(city_params)
    if @city.save
      render json: @city, status: :created, location: @city
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def city_params
    params.require(:city).permit(:name)
  end
end
