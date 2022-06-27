# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'profiles/edit', type: :view do
  before do
    @profile = assign(:profile, Profile.create!(
                                  email: 'MyString',
                                  birthday: 'MyString',
                                  occupation: 'MyString',
                                  status: 'MyString',
                                  birthplace: 'MyString',
                                  web: 'MyString',
                                  first_name: 'MyString',
                                  last_name: 'MyString'
                                ))
  end

  it 'renders the edit profile form' do
    render

    assert_select 'form[action=?][method=?]', profile_path(@profile), 'post' do
      assert_select 'input[name=?]', 'profile[email]'

      assert_select 'input[name=?]', 'profile[birthday]'

      assert_select 'input[name=?]', 'profile[occupation]'

      assert_select 'input[name=?]', 'profile[status]'

      assert_select 'input[name=?]', 'profile[birthplace]'

      assert_select 'input[name=?]', 'profile[web]'

      assert_select 'input[name=?]', 'profile[first_name]'

      assert_select 'input[name=?]', 'profile[last_name]'
    end
  end
end
