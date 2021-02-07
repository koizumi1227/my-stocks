ruby '2.7.1'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.0.3'

# Assets
gem 'uglifier'
gem 'sass-rails'
gem 'mini_racer'
gem 'webpacker'

# Application server
gem 'puma'
gem 'rack'

# Authentication
gem 'bcrypt'
gem 'pundit'
gem 'devise'

# Configuration
gem 'config'

# Cron
# TODO: cron使用時にコメント解除
# gem 'whenever', require: false

# Database
gem 'mysql2'

# Decorator
gem 'draper'

# Form
gem 'simple_form'

# HTTP Client
gem 'faraday'
gem 'faraday_middleware'

# Model'
gem 'enum_help'

# Search
gem 'ransack'

# Pagination
gem 'pagy'

# Seeds
gem 'seed-fu'

# Sort
gem 'acts_as_list'

# UI/UX
gem 'meta-tags'
gem 'rails-i18n', '~> 6.0.0'
gem 'slim-rails'

# Logging
gem 'lograge'

# Faster rails boot
gem 'bootsnap', require: false

# Email Preview
gem 'letter_opener_web'

# Faster rails boot
gem 'bootsnap', require: false

# Seeds
gem 'gimei'

# group :staging, :development do
# Email Preview
# gem 'letter_opener_web'
# end

group :staging, :development, :test do
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen'

  gem 'rails-erd'

  # Table/Schema
  gem 'annotate'

  # Debugger
  gem 'better_errors'
  gem 'binding_of_caller'

  # Process Manager
  gem 'foreman'

  # Performance Profiler
  gem 'rack-mini-profiler'
end

group :development, :test do
  # CLI
  gem 'spring'
  gem 'spring-commands-rspec'

  # Debugger
  gem 'pry-byebug'
  gem 'pry-rails'

  # Seeds
  gem 'faker'
  gem 'gimei'
  gem 'takarabako'
end

group :test do
  gem 'database_rewinder'
  gem 'rails-controller-testing'
  gem 'test-prof'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
