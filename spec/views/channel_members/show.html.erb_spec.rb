# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'channel_members/show', type: :view do
  before do
    @channel_member = assign(:channel_member, ChannelMember.create!(
                                                status: 'Status'
                                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Status/)
  end
end
