require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ikki
  class Application < Rails::Application
    config.generators do |generator|
  generator.helper false
  generator.javascripts false
  generator.stylesheets false
  generator.template_engine :slim
end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
