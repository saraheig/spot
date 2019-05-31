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

  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    # Get the language of the browser using the safe navigation operator
    header_locale = request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first&.to_sym
    if I18n.available_locales.include? header_locale
      # Get the language of the browser only if it is in the available_locales of the app
      I18n.locale = header_locale
    end
    logger.debug "* Locale set to '#{I18n.locale}'"
  end
end
