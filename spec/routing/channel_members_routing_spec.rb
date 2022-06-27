# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChannelMembersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/channel_members').to route_to('channel_members#index')
    end

    it 'routes to #new' do
      expect(get: '/channel_members/new').to route_to('channel_members#new')
    end

    it 'routes to #show' do
      expect(get: '/channel_members/1').to route_to('channel_members#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/channel_members/1/edit').to route_to('channel_members#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/channel_members').to route_to('channel_members#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/channel_members/1').to route_to('channel_members#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/channel_members/1').to route_to('channel_members#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/channel_members/1').to route_to('channel_members#destroy', id: '1')
    end
  end
end
