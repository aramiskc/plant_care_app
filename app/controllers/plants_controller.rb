class PlantsController < ApplicationController
  class PlantsController < ApplicationController
    def index
      @plants = Plant.all
      render json: @plants
    end

    def show
      @plant = Plant.find(params[:id])
      render json: @plant
    end

    def create
      @plant = Plant.new(plant_params)
      if @plant.save
        render json: @plant, status: :created
      else
        render json: @plant.errors, status: :unprocessable_entity
      end
    end

    def update
      @plant = Plant.find(params[:id])
      if @plant.update(plant_params)
        render json: @plant
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
end
