# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'social_accounts/new', type: :view do
  before do
    assign(:social_account, SocialAccount.new(
                              github_account: nil,
                              linkedin_account: nil,
                              google_account: nil,
                              fcabook_account: nil
                            ))
  end

  it 'renders new social_account form' do
    render

    assert_select 'form[action=?][method=?]', social_accounts_path, 'post' do
      assert_select 'input[name=?]', 'social_account[github_account_id]'

      assert_select 'input[name=?]', 'social_account[linkedin_account_id]'

      assert_select 'input[name=?]', 'social_account[google_account_id]'

      assert_select 'input[name=?]', 'social_account[fcabook_account_id]'
    end
  end
end
