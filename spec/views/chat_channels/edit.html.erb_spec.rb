# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'chat_channels/edit', type: :view do
  before do
    @chat_channel = assign(:chat_channel, ChatChannel.create!(
                                            name: 'MyString',
                                            status: 'MyString',
                                            private: 'MyString',
                                            personal: 'MyString'
                                          ))
  end

  it 'renders the edit chat_channel form' do
    render

    assert_select 'form[action=?][method=?]', chat_channel_path(@chat_channel), 'post' do
      assert_select 'input[name=?]', 'chat_channel[name]'

      assert_select 'input[name=?]', 'chat_channel[status]'

      assert_select 'input[name=?]', 'chat_channel[private]'

      assert_select 'input[name=?]', 'chat_channel[personal]'
    end
  end
end
