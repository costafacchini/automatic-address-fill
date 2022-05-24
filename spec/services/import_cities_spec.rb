require 'rails_helper'

RSpec.describe ImportCities do
  let(:file_path) { 'spec/fixtures/CITIES' }
  subject { described_class.new(file_path) }

  describe '#call' do
    it 'imports cities' do
      subject.call

      city = City.first
      expect(City.count).to eq(1)
      expect(city.code).to eq('00001')
      expect(city.name).to eq('LUXEMBOURG')
    end
  end
end
