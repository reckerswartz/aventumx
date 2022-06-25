# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'social_accounts/edit', type: :view do
  before do
    @social_account = assign(:social_account, SocialAccount.create!(
                                                github_account: nil,
                                                linkedin_account: nil,
                                                google_account: nil,
                                                fcabook_account: nil
                                              ))
  end

  it 'renders the edit social_account form' do
    render

    assert_select 'form[action=?][method=?]', social_account_path(@social_account), 'post' do
      assert_select 'input[name=?]', 'social_account[github_account_id]'

      assert_select 'input[name=?]', 'social_account[linkedin_account_id]'

      assert_select 'input[name=?]', 'social_account[google_account_id]'

      assert_select 'input[name=?]', 'social_account[fcabook_account_id]'
    end
  end
end
