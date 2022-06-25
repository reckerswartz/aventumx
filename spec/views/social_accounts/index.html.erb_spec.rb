# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'social_accounts/index', type: :view do
  before do
    assign(:social_accounts, [
             SocialAccount.create!(
               github_account: nil,
               linkedin_account: nil,
               google_account: nil,
               fcabook_account: nil
             ),
             SocialAccount.create!(
               github_account: nil,
               linkedin_account: nil,
               google_account: nil,
               fcabook_account: nil
             )
           ])
  end

  it 'renders a list of social_accounts' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
