# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'chat_channels/show', type: :view do
  before do
    @chat_channel = assign(:chat_channel, ChatChannel.create!(
                                            name: 'Name',
                                            status: 'Status',
                                            private: 'Private',
                                            personal: 'Personal'
                                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Private/)
    expect(rendered).to match(/Personal/)
  end
end
