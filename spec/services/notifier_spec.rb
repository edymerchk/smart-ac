require "rails_helper"

RSpec.describe Notifier do
  subject { described_class.new(report) }

  let(:mailer) { double(:notifier, deliver: true) }

  describe "notify" do
    context 'when the report has a warning health_status' do
      before do
        allow(NotifierMailer).to receive(:send_health_alert) { mailer }
      end

      let(:report) { create(:report, health_status: "needs_service") }

      it "triggers a mailer notification" do
        expect(mailer).to receive(:deliver)
        subject.notify
      end
    end

    context 'when the report has a monoxide level greater than 9 PPM' do

      before do
        allow(NotifierMailer).to receive(:send_monoxide_alert) { mailer }
      end

      let(:report) { create(:report, carbon_monoxide_level: 10) }

      it "triggers a mailer notification" do
        expect(mailer).to receive(:deliver)
        subject.notify
      end
    end
  end
end
