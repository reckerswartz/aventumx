# frozen_string_literal: true

# == Schema Information
#
# Table name: channel_members
#
#  id              :bigint           not null, primary key
#  discarded_at    :datetime
#  status          :integer          default(0), not null
#  uuid_secure     :uuid             not null
#  uuid_token      :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  chat_channel_id :integer          not null
#  member_id       :integer          not null
#
# Indexes
#
#  index_channel_members_on_discarded_at  (discarded_at)
#  index_channel_members_on_uuid_secure   (uuid_secure) UNIQUE
#  index_channel_members_on_uuid_token    (uuid_token) UNIQUE
#
FactoryBot.define do
  factory :channel_member do
    status { 'MyString' }
  end
end
