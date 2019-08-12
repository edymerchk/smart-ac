class AddTakenAtToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :taken_at, :datetime, null: false
  end
end
