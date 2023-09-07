class AddEndTimeToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :end_time, :datetime
  end
end
