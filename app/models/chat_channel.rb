# frozen_string_literal: true

# == Schema Information
#
# Table name: chat_channels
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  first_name   :string           not null
#  is_group     :boolean          default(FALSE), not null
#  is_private   :boolean          default(FALSE), not null
#  last_name    :string           default(""), not null
#  slug         :string           not null
#  status       :integer          default("active"), not null
#  username     :string           not null
#  uuid_secure  :uuid             not null
#  uuid_token   :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#  sender_id    :integer
#
# Indexes
#
#  index_chat_channels_on_discarded_at  (discarded_at)
#  index_chat_channels_on_slug          (slug) UNIQUE
#  index_chat_channels_on_username      (username) UNIQUE
#  index_chat_channels_on_uuid_secure   (uuid_secure) UNIQUE
#  index_chat_channels_on_uuid_token    (uuid_token) UNIQUE
#
class ChatChannel < ApplicationRecord
  ##############################################################################
  ### Includes and Extensions ##################################################
  extend FriendlyId
  ##############################################################################
  ### Constants ################################################################
  enum status: {
    active: 0,
    inactive: 1,
    deleted: 2
  }, _suffix: true
  ##############################################################################
  ### Callbacks ################################################################
  # Set default values.
  after_initialize do
    if first_name.blank?
      self.first_name = 'Channel'
      self.last_name = Haikunator.haikunate(0).downcase.tr('-', '_')
    end
    create_username if username.blank? && first_name.present?
  end
  before_save :before_save_do
  # after_create_commit :after_create_commit_do
  # after_update_commit :after_update_commit_do

  ##############################################################################
  ### Associations #############################################################
  belongs_to :owner, class_name: 'User', inverse_of: :channels, optional: true
  belongs_to :sender, class_name: 'User', optional: true
  has_many :channel_members, inverse_of: :chat_channel, dependent: :destroy_async
  has_many :members, through: :channel_members, inverse_of: :chat_channels,
                     dependent: :destroy_async
  has_many :messages, inverse_of: :chat_channel, dependent: :destroy_async
  ##############################################################################
  ### Attributes ###############################################################

  ##############################################################################
  ### Validations ##############################################################

  ##############################################################################
  ### Scopes ###################################################################

  ##############################################################################
  ### Other ####################################################################
  has_paper_trail
  has_person_name
  friendly_id :username, use: :slugged
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

  def before_save_do
    downcase_fields
  end

  def before_validation_do
    create_username
  end
  #
  # def after_create_commit_do
  # end
  #
  # def after_update_commit_do
  # end

  def downcase_fields
    first_name.downcase!
    last_name.downcase!
    username.downcase!
  end

  def create_username
    if username.blank?
      self.username =
        find_unique_username(name.parameterize(separator: '_'))
    end
  rescue StandardError
    errors.add(:username, 'cannot be created')
    throw :abort
  end

  def find_unique_username(username)
    taken_usernames =
      ChatChannel
      .with_discarded
      .where('username LIKE ?', "#{username}%")
      .pluck(:username)

    # return username if it's free
    unless taken_usernames.include?(username) ||
           ActionController::Base.instance_methods.include?(username) ||
           ActiveRecord::Base.instance_methods.include?(username) ||
           friendly_id_config.reserved_words.include?(username)
      return username
    end

    # find a unique username
    count = 1
    loop do
      # Generate the username using the original name and the random cool prefix
      new_username = "#{first_name}_#{Haikunator.haikunate(0).downcase.tr('-', '_')}".parameterize.underscore
      # If the username is not taken, return it
      unless taken_usernames.include?(new_username) ||
             ActionController::Base.instance_methods.include?(new_username) ||
             ActiveRecord::Base.instance_methods.include?(new_username) ||
             friendly_id_config.reserved_words.include?(new_username)
        Rails.logger.info { "new_username: #{new_username}" }
        return new_username
      end

      count += 1
      ## break if we've checked 100 times, to avoid infinite loop
      break if count > 100 # arbitrary number
    end
  end
end
