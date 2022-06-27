# frozen_string_literal: true

# == Schema Information
#
# Table name: chat_channels
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  first_name   :string           not null
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
require 'rails_helper'

RSpec.describe ChatChannel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
