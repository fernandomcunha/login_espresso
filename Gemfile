source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.4"

gem "rails", "~> 7.0.7", ">= 7.0.7.2"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

gem "devise", "~> 4.2"

gem 'devise-security', "~> 0.18"

gem "recaptcha", "~> 5.15"

group :development, :test do
  gem 'rspec-rails', '~> 6.0.0'
  gem 'pry', '~> 0.14.2'
end

group :development do
  gem "web-console"
end

group :test do
  gem 'simplecov', require: false
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
