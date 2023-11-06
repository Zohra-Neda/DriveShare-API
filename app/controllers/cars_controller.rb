class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  # GET /cars or /cars.json
  def index
    @cars = Car.all

    render json: @cars
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)
    # @car.user_id(current_user.id)
    if @car.save
      render json: @car, status: :created, location: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:name, :image, :description, :available, :city_id, :user_id, :price, :model)
  end
end
