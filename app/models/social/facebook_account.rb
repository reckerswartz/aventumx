# frozen_string_literal: true

# == Schema Information
#
# Table name: facebook_accounts
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  uid          :string
#  uuid_secure  :uuid             not null
#  uuid_token   :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_facebook_accounts_on_discarded_at  (discarded_at)
#  index_facebook_accounts_on_user_id       (user_id)
#  index_facebook_accounts_on_uuid_secure   (uuid_secure) UNIQUE
#  index_facebook_accounts_on_uuid_token    (uuid_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Social::FacebookAccount < ApplicationRecord
  ##############################################################################
  ### Includes and Extensions ##################################################

  ##############################################################################
  ### Constants ################################################################
  self.table_name = 'facebook_accounts'
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
  has_one :user, dependent: :destroy
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
