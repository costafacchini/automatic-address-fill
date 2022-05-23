require 'rails_helper'

RSpec.describe '/streets', type: :request do
  let(:city) { City.create!(name: 'City', code: '123') }
  let(:valid_attributes) { { name: 'Rue Number 1', code: '789', city_id: city.id } }

  describe 'GET /index' do
    it 'renders a successful response' do
      Street.create! valid_attributes
      get streets_url
      expect(response).to be_successful
    end
  end
end
