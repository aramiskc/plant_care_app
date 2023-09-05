class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :image_url
      t.datetime :watering_start_date

      t.timestamps
    end
  end
end
