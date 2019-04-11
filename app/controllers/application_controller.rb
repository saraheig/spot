class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    if (I18n.available_locales.any?{|loc| loc.to_s == extract_locale_from_accept_language_header})
      # Get the language from the browser only if it is in the available_locales of the app
      I18n.locale = extract_locale_from_accept_language_header
    end
    logger.debug "* Locale set to '#{I18n.locale}'"
  end

  private
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
end
