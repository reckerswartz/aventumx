# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/new', type: :view do
  before do
    assign(:message, Message.new(
                       sender: 'MyString',
                       receiver: 'MyString',
                       message: 'MyString'
                     ))
  end

  it 'renders new message form' do
    render

    assert_select 'form[action=?][method=?]', messages_path, 'post' do
      assert_select 'input[name=?]', 'message[sender]'

      assert_select 'input[name=?]', 'message[reciever]'

      assert_select 'input[name=?]', 'message[message]'
    end
  end
end
