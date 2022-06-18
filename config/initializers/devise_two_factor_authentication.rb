# frozen_string_literal: true

Devise.setup do |config|
  # ==> Security Extension
  # Configure security extension for devise

  config.max_login_attempts = 3 # Maximum second factor attempts count.
  config.allowed_otp_drift_seconds = 30 # Allowed TOTP time drift between client and server.
  config.otp_length = 6 # TOTP code length
  config.direct_otp_valid_for = 5.minutes # Time before direct OTP becomes invalid
  config.direct_otp_length = 6 # Direct OTP code length
  config.remember_otp_session_for_seconds = 5.days # Time before browser has to perform 2fA again. Default is 0.
  config.otp_secret_encryption_key = Rails.application.credentials[:otp_secret_encryption_key] # Encryption key for TOTP secret.
  config.second_factor_resource_id = 'id' # Field or method name used to set value for 2fA remember cookie
  config.delete_cookie_on_logout = false # Delete cookie when user signs out, to force 2fA again on login
  config.issuer_name = 'QABA' # Issuer name for generated secret
  config.logo_url = 'https://www.example.com/assets/app-logo.png' # URL for logo image
end
