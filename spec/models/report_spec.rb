require 'rails_helper'

RSpec.describe Report, type: :model do
  context 'validations' do
    it 'has a valid factory' do
      expect(build(:report)).to be_valid
    end
  end

  describe "#verify_healt_status" do
    let(:report) { build(:report) }
    let(:notifier) { double(:notifier, notify: true) }

    before { allow(Notifier).to receive(:new) { notifier } }

    it "calls the Notifier after a report is created" do
      expect(notifier).to receive(:notify)
      report.save
    end
  end
end
