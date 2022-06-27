# frozen_string_literal: true

# == Schema Information
#
# Table name: channel_members
#
#  id              :bigint           not null, primary key
#  discarded_at    :datetime
#  status          :integer          default(0), not null
#  uuid_secure     :uuid             not null
#  uuid_token      :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  chat_channel_id :integer          not null
#  member_id       :integer          not null
#
# Indexes
#
#  index_channel_members_on_discarded_at  (discarded_at)
#  index_channel_members_on_uuid_secure   (uuid_secure) UNIQUE
#  index_channel_members_on_uuid_token    (uuid_token) UNIQUE
#
class ChannelMember < ApplicationRecord
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
  belongs_to :chat_channel, inverse_of: :channel_members
  belongs_to :member, class_name: 'User', inverse_of: :channel_members
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
