FactoryBot.define do
  factory :report do
    device
    temperature { 3.10 }
    air_humidity { 10 }
    carbon_monoxide_level { 4.5 }
    health_status { "good" }
    taken_at { DateTime.now }
  end
end
