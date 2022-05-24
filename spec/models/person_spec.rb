require 'rails_helper'

RSpec.describe Person, type: :model do
  describe '#city' do
    it { is_expected.to belong_to(:city).required }
  end

  describe '#street' do
    it { is_expected.to belong_to(:street).required }
  end

  describe '#street_number' do
    it { is_expected.to belong_to(:street_number).required }
  end

  describe '#name' do
    it { is_expected.to validate_presence_of :name }
  end
end
