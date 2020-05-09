source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0', '>= 6.0.1'
# Rails internals (application bootup, plugins, generators, rake tasks)
gem 'railties', '~> 6.0', '>= 6.0.1'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3', '>= 4.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.13'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Administration framework for Ruby on Rails
gem 'activeadmin', '~> 2.4'
gem 'cancancan', '~> 3.0', '>= 3.0.1'
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'draper', '~> 3.1'
gem 'pundit', '~> 2.1'

# Use Webpack to manage app-like JavaScript modules in Rails
gem 'webpacker', '~> 4.0', '>= 4.0'

# Official AWS Ruby gem for Amazon Simple Storage Service (Amazon S3)
gem 'aws-sdk-s3', '~> 1.40'

# Ruby client library for Travis CI
gem 'travis', '~> 1.8', '>= 1.8.10'

# Ruby implementation of the Coveralls API
gem 'coveralls', require: false

# CoffeeScript adapter for the Rails asset pipeline
gem 'coffee-rails', '~> 5.0'

# Rails form builder
gem 'formtastic', '~> 3.1', '>= 3.1.5'

# Leaflet.js map display library
gem 'leaflet-rails', '~> 1.6'
# Geospatial data library
gem 'rgeo', '~> 2.1', '>= 2.1.1'
# ActiveRecord connection adapter for PostGIS
gem 'activerecord-postgis-adapter', '~> 6.0'
# Convert RGeo data to and from GeoJSON
gem 'rgeo-geojson', '~> 2.1', '>= 2.1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Automatic Ruby code style checking tool
  gem 'rubocop', '~> 0.76.0'
  # Code style checking for RSpec files
  gem 'rubocop-rspec', '~> 1.37'
  # Collection of RuboCop cops to check performance optimizations in Ruby code
  gem 'rubocop-performance', '~> 1.5', '>= 1.5.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver with Chrome
  gem 'capybara', '~> 3.29'
  # WebDrive to write automated tests of websites
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.6'
  gem 'webdrivers', '~> 4.0'
  # Make-like program implemented in Ruby (Travis CI)
  gem 'rake', '~> 13.0', '>= 13.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
