# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountSettingsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/account_settings').to route_to('account_settings#index')
    end

    it 'routes to #new' do
      expect(get: '/account_settings/new').to route_to('account_settings#new')
    end

    it 'routes to #show' do
      expect(get: '/account_settings/1').to route_to('account_settings#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/account_settings/1/edit').to route_to('account_settings#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/account_settings').to route_to('account_settings#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/account_settings/1').to route_to('account_settings#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/account_settings/1').to route_to('account_settings#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/account_settings/1').to route_to('account_settings#destroy', id: '1')
    end
  end
end
