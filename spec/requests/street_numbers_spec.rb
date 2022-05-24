require 'rails_helper'

RSpec.describe '/street_numbers', type: :request do
  let(:city) { City.create!(name: 'City', code: '123') }
  let(:street) { Street.create!(name: 'Rue Number 2', code: '483', city: city) }
  let(:valid_attributes) { { number: '001', street_id: street.id } }

  describe 'GET /index' do
    it 'renders a successful response' do
      StreetNumber.create! valid_attributes
      get street_numbers_url
      expect(response).to be_successful
    end
  end
end
