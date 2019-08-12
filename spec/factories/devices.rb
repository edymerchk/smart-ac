FactoryBot.define do
  factory :device do
    serial_number { SecureRandom.hex(32) }
    firmware_version { "1" }
  end
end
