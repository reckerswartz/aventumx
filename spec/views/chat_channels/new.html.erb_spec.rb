# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'chat_channels/new', type: :view do
  before do
    assign(:chat_channel, ChatChannel.new(
                            name: 'MyString',
                            status: 'MyString',
                            private: 'MyString',
                            personal: 'MyString'
                          ))
  end

  it 'renders new chat_channel form' do
    render

    assert_select 'form[action=?][method=?]', chat_channels_path, 'post' do
      assert_select 'input[name=?]', 'chat_channel[name]'

      assert_select 'input[name=?]', 'chat_channel[status]'

      assert_select 'input[name=?]', 'chat_channel[private]'

      assert_select 'input[name=?]', 'chat_channel[personal]'
    end
  end
end
