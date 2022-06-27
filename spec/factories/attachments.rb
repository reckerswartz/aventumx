# frozen_string_literal: true

# == Schema Information
#
# Table name: attachments
#
#  id              :bigint           not null, primary key
#  attachable_type :string           not null
#  discarded_at    :datetime
#  file_name       :string           default(""), not null
#  file_type       :string           not null
#  status          :integer          default("not_uploaded"), not null
#  uuid_secure     :uuid             not null
#  uuid_token      :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  attachable_id   :bigint           not null
#
# Indexes
#
#  index_attachments_on_attachable    (attachable_type,attachable_id)
#  index_attachments_on_discarded_at  (discarded_at)
#  index_attachments_on_uuid_secure   (uuid_secure) UNIQUE
#  index_attachments_on_uuid_token    (uuid_token) UNIQUE
#
FactoryBot.define do
  factory :attachment do
    name { 'MyString' }
  end
end
