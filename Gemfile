source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby IO.read('.ruby-version').strip

gem 'active_model_serializers'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-kaminari-views'
gem 'bugsnag'
gem 'email_validator'
gem 'foreman'
gem 'gds-sso'
gem 'govuk_admin_template'
gem 'kaminari'
gem 'pg', '>= 0.18', '< 2.0'
gem 'plek'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'capybara', '~> 3.2.0'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
end

group :test do
  gem 'database_rewinder'
  gem 'site_prism'
end

group :staging, :production do
  gem 'rails_12factor'
end
