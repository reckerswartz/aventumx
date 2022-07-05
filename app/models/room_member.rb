# frozen_string_literal: true

# == Schema Information
#
# Table name: room_members
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  role         :integer          default(0), not null
#  settings     :jsonb
#  status       :integer          default("active"), not null
#  uuid_secure  :uuid             not null
#  uuid_token   :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chat_room_id :integer          not null
#  member_id    :integer          not null
#
# Indexes
#
#  index_room_members_on_discarded_at  (discarded_at)
#  index_room_members_on_uuid_secure   (uuid_secure) UNIQUE
#  index_room_members_on_uuid_token    (uuid_token) UNIQUE
#
class RoomMember < ApplicationRecord
  ##############################################################################
  ### Includes and Extensions ##################################################

  ##############################################################################
  ### Constants ################################################################
  enum status: {
    active: 0,
    invited: 1,
    blocked: 2,
    kicked: 3,
    left: 4,
    removed: 5,
    reported: 6
  }, _suffix: true

  enum role: {
    member: 0,
    admin: 1,
    owner: 2
  }, _suffix: true

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
  belongs_to :chat_room, inverse_of: :room_members
  belongs_to :member, class_name: 'User', inverse_of: :room_members
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
