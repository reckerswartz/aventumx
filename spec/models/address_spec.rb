# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id                :bigint           not null, primary key
#  active            :boolean          default(TRUE), not null
#  addressable_type  :string
#  city              :string           default(""), not null
#  country           :string           default(""), not null
#  country_code      :string           default(""), not null
#  department        :string           default(""), not null
#  department_code   :string           default(""), not null
#  discarded_at      :datetime
#  formatted_address :string           default(""), not null
#  house_number      :string           default(""), not null
#  lat               :float            default(0.0), not null
#  lng               :float            default(0.0), not null
#  primary           :boolean          default(FALSE), not null
#  state             :string           default(""), not null
#  state_code        :string           default(""), not null
#  status            :integer          default(0), not null
#  street            :string           default(""), not null
#  street_name       :string           default(""), not null
#  street_number     :string           default(""), not null
#  uuid_secure       :uuid             not null
#  uuid_token        :uuid             not null
#  zip_code          :string           default(""), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  addressable_id    :bigint
#
# Indexes
#
#  index_addresses_on_addressable   (addressable_type,addressable_id)
#  index_addresses_on_discarded_at  (discarded_at)
#  index_addresses_on_uuid_secure   (uuid_secure) UNIQUE
#  index_addresses_on_uuid_token    (uuid_token) UNIQUE
#
require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
