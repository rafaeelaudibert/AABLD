# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Configure Ruby version
ruby '2.6.3'

# Configure Rails version
gem 'rails', '~> 5.2.2'

# Fix problem with Rails depending on broken mimemagic version
# See: https://github.com/rails/rails/issues/41750
gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'

# Use PostgreSQL as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 4.3'

# Use SCSS for stylesheets
gem 'sassc-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use Nokogiri on tests
gem 'nokogiri', '1.12.5'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Listen for changes in files for hot reload
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Allow a console on Rails error pages
  gem 'web-console', '>= 3.3.0'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'

  # Used for UI testing
  gem 'selenium-webdriver'

  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Development + Tests only gems, related to the console
group :development, :test do
  # Used for better debuggin on error pages
  gem 'binding_of_caller'

  # Better Rails Console than Pry
  gem 'hirb'

  # Better unicode formatting on Rails Console
  gem 'hirb-unicode-steakknife', require: 'hirb-unicode'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Adding devise gems
# Default Devise
gem 'devise'

# Devise ability to send mails asynchronously
gem 'devise-async'

# Ability to invite users
gem 'devise_invitable', '~> 1.7.0'

# Adding bootstrap and jquery
# Bootstrap SASS-like compilation
gem 'bootstrap-sass'

# Jquery
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'

# Rails UJS
gem 'rails-ujs', '~> 0.1.0'

# Better visualization of data on console
gem 'awesome_rails_console'

# Some useful validators
gem 'validators'

# CPF and CNPJ helpers (including validators)
gem 'cpf_cnpj'

# Random data generator
gem 'faker'

# Breadcrumbs generator
gem 'loaf'

# Pagination
gem 'pagy'

# Sidekiq (Background Worker)
gem 'sidekiq'

# Image for the user (while we don't have a way to add attachments)
gem 'letter_avatar'

# Field in place editting
gem 'best_in_place', '~> 3.0.1'

# Queries optimization
gem 'goldiloader'

# Print information in a table format in console
gem 'table_print'

# Authorization handling
gem 'cancancan'

# Errors handling gem
gem 'rambulance'

# For date manipulation
gem 'groupdate'

# Chart creation
gem 'apexcharts'

# SendGrid usage helper
gem 'sendgrid-actionmailer'

# Calendar picker
gem 'pickadate-rails'