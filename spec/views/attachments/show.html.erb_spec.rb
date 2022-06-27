# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'attachments/show', type: :view do
  before do
    @attachment = assign(:attachment, Attachment.create!(
                                        name: 'Name'
                                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
