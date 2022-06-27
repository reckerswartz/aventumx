# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'account_settings/new', type: :view do
  before do
    assign(:account_setting, AccountSetting.new)
  end

  it 'renders new account_setting form' do
    render

    assert_select 'form[action=?][method=?]', account_settings_path, 'post' do
    end
  end
end
