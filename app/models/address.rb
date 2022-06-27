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
class Address < ApplicationRecord
  ##############################################################################
  ### Includes and Extensions ##################################################

  ##############################################################################
  ### Constants ################################################################

  ##############################################################################
  ### Callbacks ################################################################
  # Set default values.
  # after_initialize do
  # end
  #
  before_save :before_save_do
  # after_create_commit :after_create_commit_do
  # after_update_commit :after_update_commit_do

  ##############################################################################
  ### Associations #############################################################
  belongs_to :addressable, polymorphic: true
  ##############################################################################
  ### Attributes ###############################################################

  ##############################################################################
  ### Validations ##############################################################

  ##############################################################################
  ### Scopes ###################################################################

  ##############################################################################
  ### Other ####################################################################

  ##############################################################################
  ### Class Methods ############################################################

  ##############################################################################
  ### Instance Methods #########################################################

  ##############################################################################
  # protected
  ##############################################################################

  ##############################################################################
  private

  ##############################################################################

  # def after_create_commit_do
  # end
  #
  # def after_update_commit_do
  # end

  def downcase_fields
    country.downcase!
  end

  def fill_country
    self.country = ISO3166::Country.find_country_by_country_code(country_code).iso_short_name if country_code.present?
  end

  def before_save_do_magic
    fill_country
    downcase_fields
  end
end
