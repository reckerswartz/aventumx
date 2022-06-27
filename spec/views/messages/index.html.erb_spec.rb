# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/index', type: :view do
  before do
    assign(:messages, [
             Message.create!(
               sender: 'Sender',
               receiver: 'Reciever',
               message: 'Message'
             ),
             Message.create!(
               sender: 'Sender',
               receiver: 'Reciever',
               message: 'Message'
             )
           ])
  end

  it 'renders a list of messages' do
    render
    assert_select 'tr>td', text: 'Sender'.to_s, count: 2
    assert_select 'tr>td', text: 'Reciever'.to_s, count: 2
    assert_select 'tr>td', text: 'Message'.to_s, count: 2
  end
end
