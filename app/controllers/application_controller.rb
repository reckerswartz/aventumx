# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action { set_meta_tags site: 'AventumX' }
  around_action :user_time_zone, if: :current_user
  around_action :switch_locale
  helper_method :current_user_role
  helper_method :current_user_roles
  # This method is used to set the whodunnit value for PaperTrail.
  # It is used to set the user who made the change.

  def user_for_paper_trail
    ## if user is logged in
    current_user.presence || "Public User (ip: #{request.remote_ip})"
  end

  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user_roles
    return [] if current_user.nil?

    @current_user_roles ||=
      current_user.roles.pluck(:name).uniq
  end

  def current_user_role
    return '' if current_user.nil? && current_user_roles.count.zero?

    @current_user_role ||=
      if current_user_roles.include?('admin')
        'admin'
      elsif current_user_roles.include?('student')
        'student'
      else
        current_user_roles.last
      end
  end

  add_flash_types :success, :info, :warning, :danger

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end

  def user_time_zone(&block) # rubocop:disable Naming/BlockForwarding
    Time.use_zone(current_user.time_zone, &block) # rubocop:disable Naming/BlockForwarding
  end

  # Setting the Locale from URL Params
  def switch_locale(&block) # rubocop:disable Naming/BlockForwarding
    locale = extract_locale || I18n.default_locale
    I18n.with_locale(locale, &block) # rubocop:disable Naming/BlockForwarding
  end

  def extract_locale
    parsed_locale = params[:locale]
    if parsed_locale.nil?
      # Setting the Locale from User Preferences
      parsed_locale = http_accept_language.compatible_language_from(current_user.try(:locale_code).split.map(&:to_sym)) if current_user.present?
      # Inferring Locale from the Language Header
      # Iain Hecker's http_accept_language library
      parsed_locale = http_accept_language.compatible_language_from(I18n.available_locales) if parsed_locale.nil?
      # if still nil or returns default locale, then try to get the locale from Inferring the Locale from IP Geolocation
      if parsed_locale.nil? || parsed_locale == I18n.default_locale
        # The IP address of the client making the request can be used to infer the client's region and thus their locale.
        # This is useful for things like localizing the language of a website based on the user's location.
        # Services such as GeoIP Lite Country or gems like geocoder can be used to implement this approach.
        ## get the IP address of the client making the request
        ## get the country code of the client making the request using the IP address using geocoder
        country_code = Geocoder.search(request.remote_ip).try(:first).try(:country_code).try(:downcase)
        ## get country language locale code using the country code
        parsed_locale = I18n.available_locales.select { |locale| locale.to_s.split('-')[0] == country_code || locale.to_s.split('-')[1] == country_code } if country_code.present?
        # In general, this approach is far less reliable than using the language header and is not recommended for most web applications.
      end
    end
    parsed_locale = :en if parsed_locale.present? && parsed_locale.to_s == 'en-US'
    I18n.available_locales.map(&:to_s).include?(parsed_locale.try(:to_s)) ? parsed_locale : nil
  end

  # it enables us to set "defaults" for url_for and helper methods dependent on it
  def default_url_options
    { locale: I18n.locale }
  end
end
