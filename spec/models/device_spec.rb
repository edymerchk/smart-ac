require 'rails_helper'

RSpec.describe Device, type: :model do
  describe "#token" do
    let(:device) { create(:device) }

    it 'generates a token before creation' do
      expect(device.token).not_to be_empty
    end
  end

  describe ".search" do
    let(:device) { create(:device, serial_number: "ABC") }
    let(:device_2) { create(:device, serial_number: "DEF") }

    it 'filters the devices using the serial_number' do
      expect(Device.search("A")).to include(device)
      expect(Device.search("A")).not_to include(device_2)
    end
  end
end
