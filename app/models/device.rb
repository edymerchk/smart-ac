class Device < ApplicationRecord
  validates :serial_number, presence: true, uniqueness: true
  validates :firmware_version, presence: true

  has_many :reports, dependent: :destroy

  before_create :generate_token

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Device.exists?(token: random_token)
    end
  end
end
