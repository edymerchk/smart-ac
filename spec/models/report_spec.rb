require 'rails_helper'

RSpec.describe Report, type: :model do
  context 'validations' do
    it 'has a valid factory' do
      expect(build(:report)).to be_valid
    end
  end
end
