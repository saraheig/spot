class ApplicationController < ActionController::Base
  before_action :set_to_param_with_title, :set_locale

  private

  # Override to_param for Responsive part (to_param is not the same as in the Administration part)
  def set_to_param_with_title
    Category.class_eval do
      def to_param
        title.downcase
      end
    end
  end

  # Set the language
  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    # Get the language from the user choice (form)
    if cookies[:language]
      I18n.locale = cookies[:language]
      logger.debug "* Locale set to '#{I18n.locale}' (user choice)"
    # Get the language from the browser using the safe navigation operator
    else
      header_locale = request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first&.to_sym
      if I18n.available_locales.include? header_locale
        # Get the language from the browser only if it is in the available_locales of the app
        I18n.locale = header_locale
        cookies[:language] = header_locale
        logger.debug "* Locale set to '#{I18n.locale}' (browser header)"
      else
        # Get the default language if the asked language is not available
        cookies[:language] = I18n.default_locale
        logger.debug "* Locale set to '#{I18n.locale}' (default value)"
      end
    end
  end
end
