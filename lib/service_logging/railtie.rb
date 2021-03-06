require "rails/railtie"

module ServiceLogging
  class Railtie < Rails::Railtie
    config.service_logging = ActiveSupport::OrderedOptions.new
    config.service_logging.lograge = ActiveSupport::OrderedOptions.new
    config.service_logging.enabled = false

    config.after_initialize do |application|
      ServiceLogging.setup(application) if application.config.service_logging.enabled
    end
  end
end
