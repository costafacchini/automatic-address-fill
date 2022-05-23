require 'rails_helper'

RSpec.describe CitiesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/cities').to route_to('cities#index')
    end

    it 'does not route to #new' do
      expect(get: '/cities/new').not_to route_to('cities#new')
    end

    it 'does not routes to #show' do
      expect(get: '/cities/1').not_to route_to('cities#show', id: '1')
    end

    it 'does not routes to #edit' do
      expect(get: '/cities/1/edit').not_to route_to('cities#edit', id: '1')
    end

    it 'does not routes to #create' do
      expect(post: '/cities').not_to route_to('cities#create')
    end

    it 'does not routes to #update via PUT' do
      expect(put: '/cities/1').not_to route_to('cities#update', id: '1')
    end

    it 'does not routes to #update via PATCH' do
      expect(patch: '/cities/1').not_to route_to('cities#update', id: '1')
    end

    it 'does not routes to #destroy' do
      expect(delete: '/cities/1').not_to route_to('cities#destroy', id: '1')
    end
  end
end
