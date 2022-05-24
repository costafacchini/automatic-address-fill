require 'rails_helper'

RSpec.describe StreetNumber, type: :model do
  describe '#number' do
    it { is_expected.to validate_presence_of :number }
  end

  describe '#street' do
    it { is_expected.to belong_to(:street).required }
  end

  describe '#people' do
    it { is_expected.to have_many(:people).dependent(:restrict_with_error) }
  end
end
