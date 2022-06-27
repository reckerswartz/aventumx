# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'chat_channels/index', type: :view do
  before do
    assign(:chat_channels, [
             ChatChannel.create!(
               name: 'Name',
               status: 'Status',
               private: 'Private',
               personal: 'Personal'
             ),
             ChatChannel.create!(
               name: 'Name',
               status: 'Status',
               private: 'Private',
               personal: 'Personal'
             )
           ])
  end

  it 'renders a list of chat_channels' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Status'.to_s, count: 2
    assert_select 'tr>td', text: 'Private'.to_s, count: 2
    assert_select 'tr>td', text: 'Personal'.to_s, count: 2
  end
end
