require "rails_helper"

RSpec.describe "Report Creation API", type: :request do
  subject do
    post(
      "/api/v1/reports",
      params:  payload.to_json,
      headers: headers
    )
  end

  let(:headers) do
    {
      "Content-Type"  => "application/vnd.api+json",
      "Authorization" => device.token,
    }
  end

  let(:device) { create(:device) }

  context 'with valid attributes' do
    let(:payload) do
      {
        data: {
          type: "reports",
          attributes: {
            device_id: device.id,
            temperature: 3.10,
            air_humidity: 10 ,
            carbon_monoxide_level: 4.5,
            health_status: "good"
          }
        }
      }
    end

    it 'returns a 201 status' do
      subject
      expect(response.status).to eq(201)
    end

    it 'creates a new report for the desired device' do
      expect{
        subject
      }.to change { device.reports.count }.by(1)
    end
  end

  context 'with invalid attributes' do
    let(:payload) do
      {
        data: {
          type: "devices",
          attributes: {
            device_id: "no-existing-device-id",
            temperature: 3.10,
            air_humidity: 10 ,
            carbon_monoxide_level: 4.5,
            health_status: "good"
          }
        }
      }
    end

    it 'returns a 422 status' do
      subject
      expect(response.status).to eq(422)
    end

    it 'does not create a new report for the desired device' do
      expect{
        subject
      }.to_not change { device.reports.count }
    end
  end

  context "when the authorization header is missing" do
    subject do
      post("/api/v1/reports")
    end

    it "returns an 401 status code" do
      subject
      expect(response.status).to eq(401)
    end
  end

  context "when the authorization header is wrong" do
    subject do
      post("/api/v1/reports", headers: { "Authorization" => "INVALID_TOKEN" })
    end

    it "returns an 401 status code" do
      subject
      expect(response.status).to eq(401)
    end
  end
end
