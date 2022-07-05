# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id           :bigint           not null, primary key
#  content      :text
#  discarded_at :datetime
#  is_forward   :boolean          default(FALSE), not null
#  is_reply     :boolean          default(FALSE), not null
#  is_thread    :boolean          default(FALSE), not null
#  status       :integer          default("pending"), not null
#  uuid_secure  :uuid             not null
#  uuid_token   :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chat_room_id :integer          not null
#  parent_id    :integer
#  sender_id    :integer          not null
#
# Indexes
#
#  index_messages_on_discarded_at  (discarded_at)
#  index_messages_on_uuid_secure   (uuid_secure) UNIQUE
#  index_messages_on_uuid_token    (uuid_token) UNIQUE
#
require 'rails_helper'

RSpec.describe Message, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
