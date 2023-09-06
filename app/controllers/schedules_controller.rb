class SchedulesController < ApplicationController
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to @schedule
    else
      render "new"
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:plant_id, :user_id, :watering_start_date)
  end
end
