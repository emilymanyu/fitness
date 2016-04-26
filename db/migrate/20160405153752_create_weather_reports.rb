class CreateWeatherReports < ActiveRecord::Migration
  def change
    create_table :weather_reports do |t|
      t.string :data
      t.string :temp_high
      t.string :temp_low
      t.string :weather

      t.timestamps null: false
    end
  end
end
