# frozen_string_literal: true

# == Schema Information
#
# Table name: attachments
#
#  id              :bigint           not null, primary key
#  attachable_type :string           not null
#  discarded_at    :datetime
#  file_name       :string           default(""), not null
#  file_type       :string           not null
#  status          :integer          default("not_uploaded"), not null
#  uuid_secure     :uuid             not null
#  uuid_token      :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  attachable_id   :bigint           not null
#
# Indexes
#
#  index_attachments_on_attachable    (attachable_type,attachable_id)
#  index_attachments_on_discarded_at  (discarded_at)
#  index_attachments_on_uuid_secure   (uuid_secure) UNIQUE
#  index_attachments_on_uuid_token    (uuid_token) UNIQUE
#
class Attachment < ApplicationRecord
  ##############################################################################
  ### Includes and Extensions ##################################################

  ##############################################################################
  ### Constants ################################################################
  enum status: {
    not_uploaded: 0,
    uploaded: 1,
    uploading: 2,
    uploaded_processing: 3,
    uploaded_discarded: 3,
    upload_error: 4,
    reported: 5
  }

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
  has_one_attached :file
  # polimorphic association
  belongs_to :attachable, polymorphic: true

  ##############################################################################
  ### Attributes ###############################################################

  ##############################################################################
  ### Validations ##############################################################
  validates :file, attached: true, size: { between: (1.kilobyte)..(100.megabytes), message: 'is not given between size' }
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

  def before_save_do
    find_file_type
    find_file_name
  end
  #
  # def after_create_commit_do
  # end
  #
  # def after_update_commit_do
  # end

  def find_file_type
    # check if file is image or video or document/pdf or other
    self.file_type = if file.content_type.include?('image')
                       'image'
                     elsif file.content_type.include?('video')
                       'video'
                     elsif file.content_type.include?('pdf')
                       'pdf'
                     else
                       'other'
                     end
  end

  def find_file_name
    # get file name from file url
    self.file_name = file.original_filename if file.attached? && file.original_filename.present? && file_name.blank?
  end
end
