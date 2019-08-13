class SerializableDevice < JSONAPI::Serializable::Resource
  type 'devices'

  attributes :serial_number, :firmware_version, :token

end
