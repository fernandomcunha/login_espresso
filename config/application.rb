# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

require 'dotenv'
Dotenv.load('.env')

Bundler.require(*Rails.groups)

module LoginEspresso
  class Application < Rails::Application
    config.load_defaults 7.0
  end
end
