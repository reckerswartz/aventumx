# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/edit', type: :view do
  before do
    @message = assign(:message, Message.create!(
                                  sender: 'MyString',
                                  receiver: 'MyString',
                                  message: 'MyString'
                                ))
  end

  it 'renders the edit message form' do
    render

    assert_select 'form[action=?][method=?]', message_path(@message), 'post' do
      assert_select 'input[name=?]', 'message[sender]'

      assert_select 'input[name=?]', 'message[reciever]'

      assert_select 'input[name=?]', 'message[message]'
    end
  end
end
