require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Spot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Configure the i18n: Locales available for the application
    config.i18n.available_locales = %i[en fr]
    # Configure the i18n: Set default locale to :fr instead of :en
    config.i18n.default_locale = :en
    # Configure time zone
    config.time_zone = 'Bern'
  end
end
