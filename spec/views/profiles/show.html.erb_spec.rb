# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'profiles/show', type: :view do
  before do
    @profile = assign(:profile, Profile.create!(
                                  email: 'Email',
                                  birthday: 'Birthday',
                                  occupation: 'Occupation',
                                  status: 'Status',
                                  birthplace: 'Birthplace',
                                  web: 'Web',
                                  first_name: 'First Name',
                                  last_name: 'Last Name'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Birthday/)
    expect(rendered).to match(/Occupation/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Birthplace/)
    expect(rendered).to match(/Web/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
  end
end
