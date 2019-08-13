class ModifyAirHumidityTypeOnReports < ActiveRecord::Migration[5.2]
  def change
    change_column :reports, :air_humidity, 'integer USING CAST(air_humidity AS integer)'
  end
end
