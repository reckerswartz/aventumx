# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'profiles/index', type: :view do
  before do
    assign(:profiles, [
             Profile.create!(
               email: 'Email',
               birthday: 'Birthday',
               occupation: 'Occupation',
               status: 'Status',
               birthplace: 'Birthplace',
               web: 'Web',
               first_name: 'First Name',
               last_name: 'Last Name'
             ),
             Profile.create!(
               email: 'Email',
               birthday: 'Birthday',
               occupation: 'Occupation',
               status: 'Status',
               birthplace: 'Birthplace',
               web: 'Web',
               first_name: 'First Name',
               last_name: 'Last Name'
             )
           ])
  end

  it 'renders a list of profiles' do
    render
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Birthday'.to_s, count: 2
    assert_select 'tr>td', text: 'Occupation'.to_s, count: 2
    assert_select 'tr>td', text: 'Status'.to_s, count: 2
    assert_select 'tr>td', text: 'Birthplace'.to_s, count: 2
    assert_select 'tr>td', text: 'Web'.to_s, count: 2
    assert_select 'tr>td', text: 'First Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Last Name'.to_s, count: 2
  end
end
