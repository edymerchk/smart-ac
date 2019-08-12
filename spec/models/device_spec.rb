require 'rails_helper'

RSpec.describe Device, type: :model do
  describe "#token" do
    let(:device) { create(:device) }

    it 'generates a token before creation' do
      expect(device.token).not_to be_empty
    end
  end
end
