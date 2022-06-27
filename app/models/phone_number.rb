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
#  status                       :integer          default(0), not null
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
class PhoneNumber < ApplicationRecord
  ##############################################################################
  ### Includes and Extensions ##################################################

  ##############################################################################
  ### Attributes ###############################################################

  ##############################################################################
  ### Constants ################################################################

  ##############################################################################
  ### Callbacks ################################################################
  before_validation :update_phone
  before_save :fill_fields
  ##############################################################################
  ### Associations #############################################################
  belongs_to :phoneable, polymorphic: true

  ##############################################################################
  ### Validations ##############################################################
  validates :full_international, phone: true

  ##############################################################################
  ### Scopes ###################################################################

  ##############################################################################
  ### Other ####################################################################
  has_paper_trail

  ##############################################################################
  ### Class Methods ############################################################

  ##############################################################################
  ### Instance Methods #########################################################
  def phone_parsed
    Phonelib.parse(number, char_3_code.upcase)
  end

  #########

  # protected

  #########

  #######

  private

  #######
  def update_phone
    self.full_international = phone_parsed.full_e164
    self.country_code = phone_parsed.country_code
  end

  def fill_fields
    self.country_code = phone_parsed.country_code || ''
    self.national_dialing_prefix = phone_parsed.national
    self.name = phone_parsed.country || ''
    self.international_dialing_prefix = phone_parsed.e164 || ''
    self.area_code = phone_parsed.area_code || ''
    self.extension = phone_parsed.extension || ''
  end
end
