require 'rails_helper'

RSpec.describe ImportStreetNumbers do
  let(:city) { City.create!(name: 'LUXEMBOURG', code: '00393') }
  let!(:street) { Street.create!(name: 'RUE NUMBER 1', code: '09644', city: city) }
  let(:file_path) { 'spec/fixtures/STREETNUMBERS' }
  subject { described_class.new(file_path) }

  describe '#call' do
    it 'imports street numbers' do
      subject.call

      street_number = StreetNumber.first
      expect(StreetNumber.count).to eq(1)
      expect(street_number.number).to eq('001')
      expect(street_number.street.name).to eq('RUE NUMBER 1')
    end
  end
end
