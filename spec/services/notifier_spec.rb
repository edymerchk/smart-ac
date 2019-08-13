require "rails_helper"

RSpec.describe Notifier do
  subject { described_class.new(report) }

  let(:mailer) { double(:notifier, deliver: true) }

  before do
    allow(NotifierMailer).to receive(:send_health_alert) { mailer }
  end

  describe "notify" do
    context 'when the report has a warning health_status' do
      let(:report) { build(:report, health_status: "needs_service") }

      it "triggers a mailer notification" do
        expect(mailer).to receive(:deliver)
        subject.notify
      end
    end

    context 'when the report has a monoxide level greater than 9 PPM' do
      let(:report) { build(:report, carbon_monoxide_level: 10) }

      it "triggers a mailer notification" do
        expect(mailer).to receive(:deliver)
        subject.notify
      end
    end
  end
end
