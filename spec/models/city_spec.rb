require 'rails_helper'

RSpec.describe City, type: :model do
  describe '#postal_codes' do
    it { is_expected.to have_many(:postal_codes).dependent(:restrict_with_error) }
  end

  describe '#people' do
    it { is_expected.to have_many(:people).dependent(:restrict_with_error) }
  end

  describe '#street' do
    it { is_expected.to have_many(:street).dependent(:restrict_with_error) }
  end

  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_presence_of :name }
end
