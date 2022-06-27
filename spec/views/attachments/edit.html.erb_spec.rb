# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'attachments/edit', type: :view do
  before do
    @attachment = assign(:attachment, Attachment.create!(
                                        name: 'MyString'
                                      ))
  end

  it 'renders the edit attachment form' do
    render

    assert_select 'form[action=?][method=?]', attachment_path(@attachment), 'post' do
      assert_select 'input[name=?]', 'attachment[name]'
    end
  end
end
