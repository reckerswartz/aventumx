# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.config.content_security_policy do |policy|
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :data
  policy.object_src  :none
  policy.style_src   :self, :https
  policy.script_src :self, :https
  ## enable hot reloading through ws for development
  if Rails.env.development?
    policy.default_src :self, :https, 'http://localhost:3032/ws', 'ws://localhost:3032/ws'
  else
    policy.default_src :self, :https
  end
  # Specify URI for violation reports
  # policy.report_uri "/csp-violation-report-endpoint"
end

# If you are using UJS then enable automatic nonce generation
Rails.application.config.content_security_policy_nonce_generator =
  lambda do |request|
    # use the same csp nonce for turbo requests
    if request.env['HTTP_TURBO_REFERRER'].present?
      request.env['HTTP_X_TURBO_NONCE']
    else
      SecureRandom.base64(16)
    end
  end

# Set the nonce only to specific directives
Rails.application.config.content_security_policy_nonce_directives = %w[
  script-src
  style-src
]
