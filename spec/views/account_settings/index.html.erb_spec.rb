# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'account_settings/index', type: :view do
  before do
    assign(:account_settings, [
             AccountSetting.create!,
             AccountSetting.create!
           ])
  end

  it 'renders a list of account_settings' do
    render
  end
end
