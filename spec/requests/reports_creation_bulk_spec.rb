require "rails_helper"

RSpec.describe "Report Creation API", type: :request do
  subject do
    post(
      "/api/v1/reports/create_bulk",
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
        data: [{
          type: "reports",
          attributes: {
            device_id: device.id,
            temperature: 3.10,
            air_humidity: 10 ,
            carbon_monoxide_level: 4.5,
            health_status: "good",
            taken_at: (Time.now - 1.hour).to_i
          }
        },{
          type: "reports",
          attributes: {
            device_id: device.id,
            temperature: 4.10,
            air_humidity: 9 ,
            carbon_monoxide_level: 2.5,
            health_status: "good",
            taken_at: Time.now.to_i
          }
        }]
      }
    end

    it 'returns a 201 status' do
      subject
      expect(response.status).to eq(201)
    end

    it 'creates a 2 reports for the desired device' do
      expect{
        subject
      }.to change { device.reload.reports.count }.by(2)
    end
  end
end
