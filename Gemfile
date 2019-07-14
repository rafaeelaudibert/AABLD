# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'rails', '~> 5.2.2'

# Use PostgreSQL as the database for Active Record
gem 'pg'
gem 'sqlite3', '~> 1.3.6'

# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby
gem 'nokogiri', '1.10.1'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
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
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Development + Tests only gems, related to the console
group :development, :test do
  gem 'awesome_rails_console'
  gem 'binding_of_caller'
  gem 'hirb'
  gem 'hirb-unicode-steakknife', require: 'hirb-unicode'
  gem 'pry-stack_explorer'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Adding devise
gem 'devise'
gem 'devise-async'
gem 'devise_invitable', '~> 1.7.0'

# Adding bootstrap and jquery
gem 'bootstrap-sass'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'rails-ujs', '~> 0.1.0'

# Adding some useful validators
gem 'cpf_cnpj'
gem 'validators'

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
