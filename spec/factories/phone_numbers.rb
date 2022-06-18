# frozen_string_literal: true

# == Schema Information
#
# Table name: phone_numbers
#
#  id                           :bigint           not null, primary key
#  active                       :boolean          default(TRUE), not null
#  area_code                    :string           default(""), not null
#  char_3_code                  :string           default(""), not null
#  country_code                 :string           default(""), not null
#  discarded_at                 :datetime
#  extension                    :string           default(""), not null
#  full_international           :string           default(""), not null
#  international_dialing_prefix :string           default(""), not null
#  name                         :string           default(""), not null
#  national_dialing_prefix      :string           default(""), not null
#  number                       :string           default(""), not null
#  phoneable_type               :string
#  primary                      :boolean          default(FALSE), not null
#  status                       :string           default("draft"), not null
#  uuid_secure                  :uuid             not null
#  uuid_token                   :uuid             not null
#  verified                     :boolean          default(FALSE), not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  phoneable_id                 :bigint
#
# Indexes
#
#  index_phone_numbers_on_discarded_at  (discarded_at)
#  index_phone_numbers_on_phoneable     (phoneable_type,phoneable_id)
#  index_phone_numbers_on_uuid_secure   (uuid_secure) UNIQUE
#  index_phone_numbers_on_uuid_token    (uuid_token) UNIQUE
#
FactoryBot.define do
  factory :phone_number do
    formatted_address { 'MyString' }
  end
end
