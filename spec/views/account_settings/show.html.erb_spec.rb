# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'account_settings/show', type: :view do
  before do
    @account_setting = assign(:account_setting, AccountSetting.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
