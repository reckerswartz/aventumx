# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'channel_members/index', type: :view do
  before do
    assign(:channel_members, [
             ChannelMember.create!(
               status: 'Status'
             ),
             ChannelMember.create!(
               status: 'Status'
             )
           ])
  end

  it 'renders a list of channel_members' do
    render
    assert_select 'tr>td', text: 'Status'.to_s, count: 2
  end
end
