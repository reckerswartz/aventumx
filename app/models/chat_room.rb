# frozen_string_literal: true

# == Schema Information
#
# Table name: chat_rooms
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  first_name   :string           not null
#  is_direct    :boolean          default(FALSE), not null
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
#  index_chat_channels_on_username   (username) UNIQUE
#  index_chat_rooms_on_discarded_at  (discarded_at)
#  index_chat_rooms_on_slug          (slug) UNIQUE
#  index_chat_rooms_on_uuid_secure   (uuid_secure) UNIQUE
#  index_chat_rooms_on_uuid_token    (uuid_token) UNIQUE
#
class ChatRoom < ApplicationRecord
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
      self.first_name = 'Room'
      self.last_name = Haikunator.haikunate(0).downcase.tr('-', '_')
    end
    create_username if username.blank? && first_name.present?
  end
  before_save :before_save_do
  # after_create_commit :after_create_commit_do
  # after_update_commit :after_update_commit_do

  ##############################################################################
  ### Associations #############################################################
  belongs_to :owner, class_name: 'User', inverse_of: :rooms, optional: true
  belongs_to :sender, class_name: 'User', optional: true
  has_many :room_members, inverse_of: :chat_room, dependent: :destroy_async
  has_many :members, through: :room_members, inverse_of: :chat_rooms,
                     dependent: :destroy_async
  has_many :messages, inverse_of: :chat_room, dependent: :destroy_async
  ##############################################################################
  ### Attributes ###############################################################

  ##############################################################################
  ### Validations ##############################################################
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }
  validates :status, inclusion: { in: statuses.keys }
  validates :is_direct, :is_group, :is_private, presence: true, inclusion: { in: [true, false] }
  ## if is_direct is true, then maximum channel members can be 2
  validates :members, length: { maximum: 2, minimum: 2, message: 'minimum members is 2' }, unless: :is_direct?
  ## if is_direct is false, then maximum channel members can be 100
  validates :members, length: { maximum: 100, minimum: 2, message: 'maximum members is 100' }, if: :is_direct?
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
    fields_auto_fill
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

  def fields_auto_fill
    if is_private?
      self.is_group = true
      self.is_direct = false
    elsif is_group?
      self.is_direct = false
    elsif is_direct?
      self.is_group = false
    end
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
end
