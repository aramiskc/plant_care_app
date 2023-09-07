class SchedulesController < ApplicationController
  def create
    @schedule = Schedule.new(
      user_id: current_user.id,
      plant_id: params[:plant_id],
      watering_start_date: params[:watering_start_date],
      end_time: params[:end_time],
    )
    if @schedule.save
      render json: @schedule
    else
      render json: { errors: @schedule.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @schedules = current_user.schedules
    render json: @schedules
  end

  def show
    @schedule = Schedule.find(params[:id])
    render json: @schedule
  end
end
