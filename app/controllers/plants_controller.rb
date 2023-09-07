class PlantsController < ApplicationController
  def index
    @plants = Plant.all
    render json: @plants
  end

  def create
    @plant = Plant.new(
      name: params[:name],
      description: params[:description],
      amount_of_sun: params[:amount_of_sun],
      days_to_water: params[:days_to_water],
    )
    if @plant.save
      render json: @plant
    else
      render json: { errors: @plant.errors.full_messages }, status: :unprocessable_entity
    end 
  end
end
