require "rails_helper"

RSpec.describe "Device Registration API", type: :request do
  subject do
    post(
      "/api/v1/devices",
      params:  payload.to_json,
      headers: headers
    )
  end

  let(:headers) do
    {
      "Content-Type"  => "application/vnd.api+json"
    }
  end

  context 'with valid attributes' do
    let(:payload) do
      {
        data: {
          type: "devices",
          attributes: {
            serial_number: "sample-serial-number",
            firmware_version: "v1"
          }
        }
      }
    end

    it 'returns a 201 status' do
      subject
      expect(response.status).to eq(201)
    end

    it 'creates a new device' do
      expect{
        subject
      }.to change { Device.count }.by(1)
    end
  end

  context 'with invalid attributes' do
    let(:payload) do
      {
        data: {
          type: "devices",
          attributes: {
            firmware_version: "v1"
          }
        }
      }
    end

    it 'returns a 422 status' do
      subject
      expect(response.status).to eq(422)
    end

    it 'does not creates a new device' do
      expect{
        subject
      }.to_not change { Device.count}
    end
  end
end
