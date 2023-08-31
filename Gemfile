# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |_repo| "https://github.com/#{repo}.git" }

ruby '3.1.4'

gem 'rails', '~> 7.0.7', '>= 7.0.7.2'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

gem 'devise', '~> 4.2'

gem 'devise-security', '~> 0.18'

gem 'recaptcha', '~> 5.15'

gem 'devise-two-factor', '~> 5.0.0'

gem 'rqrcode', '~> 2.2.0'

gem 'bootstrap', '~> 5.3.1'

gem 'sassc-rails', '~> 2.1.2'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'importmap-rails'

group :development, :test do
  gem 'dotenv-rails', '~> 2.8.1'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'pry', '~> 0.14.2'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rubocop', '~> 1.56', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
end
