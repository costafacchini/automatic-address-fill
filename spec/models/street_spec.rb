require 'rails_helper'

RSpec.describe Street, type: :model do
  describe '#code' do
    it { is_expected.to validate_presence_of :code }
  end

  describe '#name' do
    it { is_expected.to validate_presence_of :name }
  end

  describe '#city' do
    it { is_expected.to belong_to(:city).required }
  end
end
