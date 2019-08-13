# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(email: "admin@admin.com", password: "adminadmin")


20.times do
  device = Device.create(
    serial_number: SecureRandom.hex(32),
    firmware_version: ["1", "2"].sample
  )
  1000.times do
    Report.create(
      device: device,
      temperature: rand(1.0...99.9).round(2),
      air_humidity: [*1..100].sample,
      carbon_monoxide_level: rand(1.0...99.9).round(2),
      health_status: "good",
      taken_at: rand(3.months.ago..Time.now)
    )
  end
end
