# frozen_string_literal: true

# == Schema Information
#
# Table name: chat_channels
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  first_name   :string           not null
#  is_direct    :boolean          default(FALSE), not null
#  is_group     :boolean          default(FALSE), not null
#  is_private   :boolean          default(FALSE), not null
#  last_name    :string           default(""), not null
#  slug         :string           not null
#  status       :integer          default("active"), not null
#  username     :string           not null
#  uuid_secure  :uuid             not null
#  uuid_token   :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#  sender_id    :integer
#
# Indexes
#
#  index_chat_channels_on_discarded_at  (discarded_at)
#  index_chat_channels_on_slug          (slug) UNIQUE
#  index_chat_channels_on_username      (username) UNIQUE
#  index_chat_channels_on_uuid_secure   (uuid_secure) UNIQUE
#  index_chat_channels_on_uuid_token    (uuid_token) UNIQUE
#
FactoryBot.define do
  factory :chat_room, class: 'ChatRoom' do
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.last_name }
    factory :is_direct do
      before(:create) { |chat_room| chat_room.is_direct = true }
    end
    factory :is_group do
      before(:create) { |chat_room| chat_room.is_group = true }
    end
    factory :is_private do
      before(:create) { |chat_room| chat_room.is_private = true }
    end
    trait :invalid do
      first_name { nil }
    end

    trait :with_owner do
      owner { create(:user) }
    end

    trait :with_sender do
      sender { create(:user) }
    end

    trait :with_members do
      after(:create) do |chat_room|
        create(:room_member, chat_room: chat_room)
      end
    end
  end
end
