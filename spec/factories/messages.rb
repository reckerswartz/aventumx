# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  content         :text
#  discarded_at    :datetime
#  status          :integer          default("pending"), not null
#  uuid_secure     :uuid             not null
#  uuid_token      :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  chat_channel_id :integer          not null
#  sender_id       :integer          not null
#
# Indexes
#
#  index_messages_on_discarded_at  (discarded_at)
#  index_messages_on_uuid_secure   (uuid_secure) UNIQUE
#  index_messages_on_uuid_token    (uuid_token) UNIQUE
#
FactoryBot.define do
  factory :message do
    sender { 'MyString' }
    reciever { 'MyString' }
    message { 'MyString' }
  end
end
