# frozen_string_literal: true

# == Schema Information
#
# Table name: google_accounts
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  uid          :string
#  uuid_secure  :uuid             not null
#  uuid_token   :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_google_accounts_on_discarded_at  (discarded_at)
#  index_google_accounts_on_user_id       (user_id)
#  index_google_accounts_on_uuid_secure   (uuid_secure) UNIQUE
#  index_google_accounts_on_uuid_token    (uuid_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :google_account do
    user { nil }
    uid { 'MyString' }
  end
end
