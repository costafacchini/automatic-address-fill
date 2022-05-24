require 'rails_helper'

RSpec.describe ImportPostalCodes do
  let!(:city) { City.create!(name: 'LUXEMBOURG', code: '123') }
  let(:file_path) { 'spec/fixtures/POSTALCODES' }
  subject { described_class.new(file_path) }

  describe '#call' do
    it 'imports postal codes' do
      subject.call

      postal_code = PostalCode.first
      expect(PostalCode.count).to eq(1)
      expect(postal_code.code).to eq('1009')
      expect(postal_code.city.name).to eq('LUXEMBOURG')
    end
  end
end
