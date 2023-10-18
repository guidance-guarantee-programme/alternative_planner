source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby IO.read('.ruby-version').strip

gem 'active_model_serializers'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-kaminari-views'
gem 'bugsnag'
gem 'email_validator'
gem 'faraday'
gem 'faraday-conductivity'
gem 'faraday_middleware'
gem 'foreman'
gem 'gds-sso'
gem 'govuk_admin_template'
gem 'kaminari'
gem 'pg'
gem 'plek'
gem 'puma'
gem 'rails', '~> 6.1'
gem 'sassc-rails'
gem 'sidekiq'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '0.58.2', require: false
end

group :test do
  gem 'database_rewinder'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'site_prism'
  gem 'webdrivers', require: false
  gem 'webmock'
end
