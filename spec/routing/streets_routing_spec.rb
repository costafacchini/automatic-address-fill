require 'rails_helper'

RSpec.describe StreetsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/streets').to route_to('streets#index')
    end

    it 'does not route to #new' do
      expect(get: '/streets/new').not_to route_to('streets#new')
    end

    it 'does not routes to #show' do
      expect(get: '/streets/1').not_to route_to('streets#show', id: '1')
    end

    it 'does not routes to #edit' do
      expect(get: '/streets/1/edit').not_to route_to('streets#edit', id: '1')
    end

    it 'does not routes to #create' do
      expect(post: '/streets').not_to route_to('streets#create')
    end

    it 'does not routes to #update via PUT' do
      expect(put: '/streets/1').not_to route_to('streets#update', id: '1')
    end

    it 'does not routes to #update via PATCH' do
      expect(patch: '/streets/1').not_to route_to('streets#update', id: '1')
    end

    it 'does not routes to #destroy' do
      expect(delete: '/streets/1').not_to route_to('streets#destroy', id: '1')
    end
  end
end
