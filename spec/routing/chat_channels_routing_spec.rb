# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatChannelsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/chat_channels').to route_to('chat_channels#index')
    end

    it 'routes to #new' do
      expect(get: '/chat_channels/new').to route_to('chat_channels#new')
    end

    it 'routes to #show' do
      expect(get: '/chat_channels/1').to route_to('chat_channels#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/chat_channels/1/edit').to route_to('chat_channels#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/chat_channels').to route_to('chat_channels#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/chat_channels/1').to route_to('chat_channels#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/chat_channels/1').to route_to('chat_channels#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/chat_channels/1').to route_to('chat_channels#destroy', id: '1')
    end
  end
end
