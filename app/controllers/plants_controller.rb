class PlantsController < ApplicationController
  def index
    @plants = Plant.all
    render template: "plants/index"
  end

  def show
    @plant = Plant.find(params[:id])
    render template: "plants/show"
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      render template: "plants/show"
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
      render template: "plants/show"
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :amount_of_sun, :days_to_water)
  end
end
