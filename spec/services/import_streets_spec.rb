require 'rails_helper'

RSpec.describe ImportStreets do
  let!(:city) { City.create!(name: 'LUXEMBOURG', code: '00393') }
  let(:file_path) { 'spec/fixtures/STREETS' }
  subject { described_class.new(file_path) }

  describe '#call' do
    it 'imports streets' do
      subject.call

      street = Street.first
      expect(Street.count).to eq(1)
      expect(street.code).to eq('07732')
      expect(street.name).to eq('BEIM STEEBROCH')
      expect(street.city.name).to eq('LUXEMBOURG')
    end
  end
end
