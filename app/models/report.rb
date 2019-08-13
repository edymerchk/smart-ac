class Report < ApplicationRecord
  belongs_to :device

  validates :temperature, presence: true
  validates :air_humidity, presence: true
  validates :carbon_monoxide_level, presence: true
  validates :health_status, presence: true
  validates :taken_at, presence: true
end
