class SerializableReport < JSONAPI::Serializable::Resource
  type 'reports'

  attributes :temperature, :air_humidity, :carbon_monoxide_level, :health_status, :taken_at

end
