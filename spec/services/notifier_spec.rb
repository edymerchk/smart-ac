require "rails_helper"

RSpec.describe Notifier do
  subject { described_class.new(report) }

  describe "notify" do
    context 'when the report has a warning healt_status' do
      let(:report) { build(:report, healt_status: "needs_service") }

      it "triggers a notification" do
        subject.notify

        # expect
      end
    end

    context 'when the report has a monoxide level greater than 9 PPM' do
      let(:report) { build(:report, carbon_monoxide_level: 10) }

      it "triggers a notification" do
        subject.notify

        # expect
      end
    end
  end
end
