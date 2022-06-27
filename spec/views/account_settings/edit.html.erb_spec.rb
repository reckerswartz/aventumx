# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'account_settings/edit', type: :view do
  before do
    @account_setting = assign(:account_setting, AccountSetting.create!)
  end

  it 'renders the edit account_setting form' do
    render

    assert_select 'form[action=?][method=?]', account_setting_path(@account_setting), 'post' do
    end
  end
end
