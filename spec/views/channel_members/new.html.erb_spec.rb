# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'channel_members/new', type: :view do
  before do
    assign(:channel_member, ChannelMember.new(
                              status: 'MyString'
                            ))
  end

  it 'renders new channel_member form' do
    render

    assert_select 'form[action=?][method=?]', channel_members_path, 'post' do
      assert_select 'input[name=?]', 'channel_member[status]'
    end
  end
end
