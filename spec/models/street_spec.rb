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

  describe '#street_numbers' do
    it { is_expected.to have_many(:street_numbers).dependent(:restrict_with_error) }
  end

  describe '#people' do
    it { is_expected.to have_many(:people).dependent(:restrict_with_error) }
  end
end
