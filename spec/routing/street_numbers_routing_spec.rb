require 'rails_helper'

RSpec.describe StreetNumbersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/street_numbers').to route_to('street_numbers#index')
    end

    it 'does not route to #new' do
      expect(get: '/street_numbers/new').not_to route_to('street_numbers#new')
    end

    it 'does not routes to #show' do
      expect(get: '/street_numbers/1').not_to route_to('street_numbers#show', id: '1')
    end

    it 'does not routes to #edit' do
      expect(get: '/street_numbers/1/edit').not_to route_to('street_numbers#edit', id: '1')
    end

    it 'does not routes to #create' do
      expect(post: '/street_numbers').not_to route_to('street_numbers#create')
    end

    it 'does not routes to #update via PUT' do
      expect(put: '/street_numbers/1').not_to route_to('street_numbers#update', id: '1')
    end

    it 'does not routes to #update via PATCH' do
      expect(patch: '/street_numbers/1').not_to route_to('street_numbers#update', id: '1')
    end

    it 'does not routes to #destroy' do
      expect(delete: '/street_numbers/1').not_to route_to('street_numbers#destroy', id: '1')
    end
  end
end
