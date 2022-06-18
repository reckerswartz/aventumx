# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                            :bigint           not null, primary key
#  confirmation_sent_at          :datetime
#  confirmation_token            :string
#  confirmed_at                  :datetime
#  current_sign_in_at            :datetime
#  current_sign_in_ip            :inet
#  date_of_birth                 :date
#  direct_otp                    :string
#  direct_otp_sent_at            :datetime
#  discarded_at                  :datetime
#  email                         :string           default(""), not null
#  encrypted_otp_secret_key      :string
#  encrypted_otp_secret_key_iv   :string
#  encrypted_otp_secret_key_salt :string
#  encrypted_password            :string           default(""), not null
#  expired_at                    :datetime
#  failed_attempts               :integer          default(0), not null
#  first_name                    :string           default(""), not null
#  gender                        :integer          default("draft"), not null
#  honorific                     :integer          default("draft"), not null
#  last_activity_at              :datetime
#  last_name                     :string           default(""), not null
#  last_sign_in_at               :datetime
#  last_sign_in_ip               :inet
#  locked_at                     :datetime
#  paranoid_verification_attempt :integer          default(0)
#  paranoid_verification_code    :string
#  paranoid_verified_at          :datetime
#  password_changed_at           :datetime
#  pronoun                       :integer          default("draft"), not null
#  remember_created_at           :datetime
#  reset_password_sent_at        :datetime
#  reset_password_token          :string
#  second_factor_attempts_count  :integer          default(0)
#  sign_in_count                 :integer          default(0), not null
#  slug                          :string
#  status                        :integer          default("draft"), not null
#  suspend_reason                :string           default(""), not null
#  suspended                     :boolean          default(FALSE), not null
#  time_zone                     :string           default("UTC"), not null
#  totp_timestamp                :datetime
#  unconfirmed_email             :string
#  unlock_token                  :string
#  username                      :string           default(""), not null
#  uuid_secure                   :uuid             not null
#  uuid_token                    :uuid             not null
#  verification                  :integer          default(0), not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  unique_session_id             :string
#
# Indexes
#
#  index_users_on_confirmation_token          (confirmation_token) UNIQUE
#  index_users_on_discarded_at                (discarded_at)
#  index_users_on_email                       (email) UNIQUE
#  index_users_on_encrypted_otp_secret_key    (encrypted_otp_secret_key) UNIQUE
#  index_users_on_expired_at                  (expired_at)
#  index_users_on_last_activity_at            (last_activity_at)
#  index_users_on_paranoid_verification_code  (paranoid_verification_code)
#  index_users_on_paranoid_verified_at        (paranoid_verified_at)
#  index_users_on_password_changed_at         (password_changed_at)
#  index_users_on_reset_password_token        (reset_password_token) UNIQUE
#  index_users_on_slug                        (slug) UNIQUE
#  index_users_on_unlock_token                (unlock_token) UNIQUE
#  index_users_on_username                    (username) UNIQUE
#  index_users_on_uuid_secure                 (uuid_secure) UNIQUE
#  index_users_on_uuid_token                  (uuid_token) UNIQUE
#
class User < ApplicationRecord
  ##############################################################################
  ### Includes and Extensions ##################################################
  rolify
  extend FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :two_factor_authenticatable,
         :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable,
         :trackable,
         :password_expirable,
         :secure_validatable,
         :password_archivable,
         :session_limitable,
         :pwned_password
  ##############################################################################
  ### Constants ################################################################
  enum status: { draft: 0, active: 1, archived: 2 }, _suffix: true
  enum gender: { draft: 0, male: 1, female: 2, non_gendered: 3 }, _suffix: true
  enum honorific: { draft: 0, master: 1, mx: 2, mr: 3, mrs: 4, miss: 5, ms: 6, sir: 7, dr: 8, cllr: 9 }, _suffix: true
  enum pronoun: { draft: 0, 'she/her': 1, 'he/him': 2, 'they/them': 3, 'ze/hir': 4 }, _suffix: true

  ##############################################################################
  ### Callbacks ################################################################
  # Set default values.
  after_initialize do
    size = 15
    self.password ||= "#{SecureRandom.hex(size)[0, size].to_s.upcase}#{SecureRandom.hex(size)[0, size].to_s.downcase}!#" if id.blank?
    create_username if username.blank? && first_name.present?
  end

  before_validation :before_validation_do
  before_save :before_save_do
  after_create_commit :after_create_commit_do
  after_update_commit :after_update_commit_do
  ##############################################################################
  ### Associations #############################################################
  has_one_time_password(encrypted: true)
  has_many :visits, class_name: 'Ahoy::Visit', dependent: :destroy_async
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb_square, resize_to_limit: [100, 100]
    attachable.variant :medium_square, resize_to_limit: [300, 300]
    attachable.variant :large_square, resize_to_limit: [600, 600]
  end
  has_one_attached :background_cover do |attachable|
    attachable.variant :thumb, resize_to_limit: [256, 156]
    attachable.variant :thumb_square, resize_to_limit: [100, 100]
    attachable.variant :medium, resize_to_limit: [320, 195]
    attachable.variant :medium_square, resize_to_limit: [300, 300]
    attachable.variant :large, resize_to_limit: [640, 390]
    attachable.variant :large_square, resize_to_limit: [600, 600]
    attachable.variant :xlarge, resize_to_limit: [1280, 720]
    attachable.variant :xlarge_square, resize_to_limit: [1000, 1000]
  end
  has_one_attached :totp_qr_code
  has_one :address, as: :addressable, dependent: :destroy_async
  has_one :phone_number, as: :phoneable, dependent: :destroy_async
  has_many :payments, dependent: :destroy_async
  ##############################################################################
  ### Attributes ###############################################################
  accepts_nested_attributes_for :phone_number
  accepts_nested_attributes_for :address

  ##############################################################################
  ### Validations ##############################################################
  validates :email,
            uniqueness: true,
            presence: true,
            'valid_email_2/email': {
              mx: true,
              disposable: true,
              disallow_subaddressing: true
            }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 255 },
                         format: { with: /\A[a-z]+\z/i, message: 'can only contain letters' }
  validates :last_name, allow_blank: true, length: { minimum: 2, maximum: 255 },
                        format: { with: /\A[a-z]+\z/i, message: 'can only contain letters' }
  validates :username, uniqueness: { case_sensitive: false },
                       presence: true,
                       length: { maximum: 255 },
                       format: { with: /\A[a-z0-9_]+\z/i, message: 'can only contain letters, numbers and dashes' }
  # NOTE: use \A and \Z to match the start and end of the string, ^ and $ match the start/end of a line.
  #
  # Due to frequent misuse of ^ and $, you need to pass the multiline: true option in case you use any of these two
  # anchors in the provided regular expression. In most cases, you should be using \A and \z.
  ##############################################################################
  ### Scopes ###################################################################

  ##############################################################################
  ### Other ####################################################################
  has_paper_trail
  has_person_name
  has_one_time_password(encrypted: true)
  friendly_id :username, use: :slugged
  ##############################################################################
  ### Class Methods ############################################################
  # discarded users to be unable to login and stop their session
  def active_for_authentication?
    super && !discarded? && !suspended
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:email))
      where(conditions).find_by(
        [
          'lower(username) = :value OR lower(email) = :value',
          { value: login.downcase }
        ]
      )
    elsif conditions[:username].nil?
      find_by(conditions)
    else
      find_by(username: conditions[:username])
    end
  end

  def send_two_factor_authentication_code(otp_code)
    Rails.logger.warn { ">>>>>>>>>>>>>>> otp_secret_key: #{otp_secret_key}, otp_code: #{otp_code}" }
  end

  def need_two_factor_authentication?(_request)
    !otp_secret_key.nil?
  end

  ##############################################################################
  ### Instance Methods #########################################################
  # reset roles of the user to use only single type role.
  def before_add_method(_role)
    self.roles = [] if roles.count.positive?
  end

  def provisioning_uri(account = nil, options = {})
    totp_secret = options[:otp_secret_key] || otp_secret_key
    options[:digits] ||= options[:otp_length] || self.class.otp_length
    raise 'provisioning_uri called with no otp_secret_key set' if totp_secret.nil?

    account ||= email if respond_to?(:email)
    options[:issuer] ||= self.class.issuer_name if self.class.issuer_name.present?
    if self.class.logo_url.blank?
      ROTP::TOTP.new(totp_secret, options).provisioning_uri(account)
    else
      image = "&image=#{self.class.logo_url}"
      ROTP::TOTP.new(totp_secret, options).provisioning_uri(account) + image
    end
  end

  #########

  # protected

  #########

  #######

  private

  #######
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
      User
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

  def assign_default_role
    add_role(:student) if roles.blank?
  end

  def downcase_fields
    first_name.downcase!
    last_name.downcase!
    username.parameterize(separator: '_').downcase!
  end

  def assign_default_timezone
    # Users::SetTimezoneJob.perform_later(id)
  end

  def assign_bg_cover(file = nil, name = nil)
    # Users::SetAutoBgCoverJob.perform_later(id, file, name)
  end

  def after_create_commit_do
    assign_bg_cover
  end

  def after_update_commit_do
    assign_default_timezone
  end

  def before_save_do
    downcase_fields
  end

  def before_validation_do
    create_username
  end

  # def generate_totp_qr_code
  #   return if totp_qr_code.attached?
  #
  #   qrcode = RQRCode::QRCode.new(provisioning_uri)
  #
  #   # NOTE: showing with default options specified explicitly
  #   png = qrcode.as_png(
  #     bit_depth: 1,
  #     border_modules: 4,
  #     color_mode: ChunkyPNG::COLOR_GRAYSCALE,
  #     color: 'black',
  #     file: nil,
  #     fill: 'white',
  #     module_px_size: 6,
  #     resize_exactly_to: false,
  #     resize_gte_to: false,
  #     size: 120
  #   )
  #   qr_image = File.binwrite("/tmp/#{uuid_secure}-qrcode.png", png.to_s)
  #   totp_qr_code.attach(io: File.open("/tmp/#{uuid_secure}-qrcode.png"), filename: 'qr_code.png', content_type: 'image/png')
  # end
end
