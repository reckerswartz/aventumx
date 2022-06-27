# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  content         :text
#  discarded_at    :datetime
#  status          :integer          default("pending"), not null
#  uuid_secure     :uuid             not null
#  uuid_token      :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  chat_channel_id :integer          not null
#  sender_id       :integer          not null
#
# Indexes
#
#  index_messages_on_discarded_at  (discarded_at)
#  index_messages_on_uuid_secure   (uuid_secure) UNIQUE
#  index_messages_on_uuid_token    (uuid_token) UNIQUE
#
class Message < ApplicationRecord
  ##############################################################################
  ### Includes and Extensions ##################################################

  ##############################################################################
  ### Constants ################################################################
  enum status: {
    pending: 0,
    sent: 1,
    delivered: 2,
    read: 3
  }, _suffix: true
  ##############################################################################
  ### AASM #####################################################################

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
  # can send images, videos, files, etc.
  has_rich_text :content
  has_many :attachments, as: :attachable, dependent: :destroy_async
  belongs_to :sender, class_name: 'User', inverse_of: :messages
  belongs_to :chat_channel, inverse_of: :messages, dependent: :destroy_async

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
  #
  # end
  # #
  # def after_create_commit_do
  #
  # end
  #
  # def after_update_commit_do
  # end
end
