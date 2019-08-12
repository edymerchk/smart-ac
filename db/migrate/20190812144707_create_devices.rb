class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :serial_number, null: true
      t.string :firmware_version, null: true
      t.string :token, null: true

      t.timestamps
    end

    add_index :devices, :serial_number, unique: true
  end
end
