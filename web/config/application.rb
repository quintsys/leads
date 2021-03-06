require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Web
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.i18n do |i|
      default_locale = :en
      fallbacks = [I18n.default_locale]
    end
    config.action_view.raise_on_missing_translations = true

    config.generators do |g|
      g.system_tests = nil
      g.test_framework = :rspec
    end

    config.logger = begin
                      logger = ActiveSupport::Logger.new(STDOUT).tap do |log|
                        log.progname = 'Web'
                      end
                      ActiveSupport::TaggedLogging.new(logger)
                    end
  end
end
