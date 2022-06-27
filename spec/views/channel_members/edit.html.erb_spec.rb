# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'channel_members/edit', type: :view do
  before do
    @channel_member = assign(:channel_member, ChannelMember.create!(
                                                status: 'MyString'
                                              ))
  end

  it 'renders the edit channel_member form' do
    render

    assert_select 'form[action=?][method=?]', channel_member_path(@channel_member), 'post' do
      assert_select 'input[name=?]', 'channel_member[status]'
    end
  end
end
