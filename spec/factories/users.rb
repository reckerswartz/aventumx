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
#  locale_code                   :string           default("en"), not null
#  locked_at                     :datetime
#  online_status                 :integer          default("offline"), not null
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
FactoryBot.define do
  factory :client, class: 'User' do
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { "#{Devise.friendly_token}Z!1" }
    password_confirmation { password }
    confirmed_at { Time.zone.today }
    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end
    factory :employee do
      after(:create) { |user| user.add_role(:employee) }
    end
    trait :invalid do
      first_name { nil }
    end
  end
end
