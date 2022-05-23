require 'rails_helper'

RSpec.describe '/cities', type: :request do
  let(:valid_attributes) { { name: 'City', code: '123' } }

  describe 'GET /index' do
    it 'renders a successful response' do
      City.create! valid_attributes
      get cities_url
      expect(response).to be_successful
    end
  end
end
