class SchedulesController < ApplicationController
  class SchedulesController < ApplicationController
    def index
      @schedules = Schedule.all
      render json: @schedules
    end

    def show
      @schedule = Schedule.find(params[:id])
      render json: @schedule
    end

    def create
      @schedule = Schedule.new(schedule_params)
      if @schedule.save
        render json: @schedule, status: :created
      else
        render json: @schedule.errors, status: :unprocessable_entity
      end
    end

    def update
      @schedule = Schedule.find(params[:id])
      if @schedule.update(schedule_params)
        render json: @schedule
      else
        render json: @schedule.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @schedule = Schedule.find(params[:id])
      @schedule.destroy
    end

    private

    def schedule_params
      params.require(:schedule).permit(:plant_id, :user_id, :image_url, :watering_start_date)
    end
  end
end
