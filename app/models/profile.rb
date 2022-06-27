# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id                  :bigint           not null, primary key
#  discarded_at        :datetime
#  first_name          :string
#  last_name           :string
#  occupation          :string
#  personal_website    :string
#  public_birthday     :string
#  public_birthplace   :string
#  public_email        :string
#  relationship_status :integer          default(0), not null
#  status              :integer          default(0), not null
#  uuid_secure         :uuid             not null
#  uuid_token          :uuid             not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint           not null
#
# Indexes
#
#  index_profiles_on_discarded_at  (discarded_at)
#  index_profiles_on_user_id       (user_id)
#  index_profiles_on_uuid_secure   (uuid_secure) UNIQUE
#  index_profiles_on_uuid_token    (uuid_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Profile < ApplicationRecord
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
  # before_save :before_save_do
  # after_create_commit :after_create_commit_do
  # after_update_commit :after_update_commit_do

  ##############################################################################
  ### Associations #############################################################
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
  # private
  ##############################################################################

  # def before_save_do
  # end
  #
  # def after_create_commit_do
  # end
  #
  # def after_update_commit_do
  # end
end
