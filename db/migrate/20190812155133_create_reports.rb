class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :device, foreign_key: true
      t.decimal :temperature
      t.string :air_humidity
      t.decimal :carbon_monoxide_level
      t.string :health_status

      t.timestamps
    end
  end
end
