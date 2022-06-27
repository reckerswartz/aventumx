# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/show', type: :view do
  before do
    @message = assign(:message, Message.create!(
                                  sender: 'Sender',
                                  receiver: 'Reciever',
                                  message: 'Message'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Sender/)
    expect(rendered).to match(/Reciever/)
    expect(rendered).to match(/Message/)
  end
end
