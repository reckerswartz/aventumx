# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'social_accounts/show', type: :view do
  before do
    @social_account = assign(:social_account, SocialAccount.create!(
                                                github_account: nil,
                                                linkedin_account: nil,
                                                google_account: nil,
                                                fcabook_account: nil
                                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
