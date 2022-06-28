# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

group :production, :staging, :development, :test do
  # Validations for Active Storage (presence)
  # Read more: https://github.com/igorkasyanchuk/active_storage_validations
  gem 'active_storage_validations', '~> 0.9.8'

  # Simple, powerful, first-party analytics for Rails
  # Read more: https://github.com/ankane/ahoy
  gem 'ahoy_matey', '~> 4.0', '>= 4.0.3'

  # easily review errors, tie an error to an individual piece of code,
  # and trace the cause back to recent changes
  gem 'airbrake', '~> 13.0'

  # Rails view helper to manage "active" state of a link
  # Read more: http://github.com/comfy/active_link_to
  gem 'active_link_to', '~> 1.0', '>= 1.0.5'

  # A wrapper around datatable's ajax methods that allow
  # synchronization with server-side pagination
  # Read more: https://github.com/jbox-web/ajax-datatables-rails
  gem 'ajax-datatables-rails', '~> 1.3', '>= 1.3.1'

  # Easy cloning of active_record objects including associations
  # and several operations under associations and attributes.
  # Read more: https://github.com/amoeba-rb/amoeba
  gem 'amoeba', '~> 3.2'

  # Takes some boilerplate out of Ruby with methods like attr_initialize.
  # Read more: https://github.com/barsoom/attr_extras
  gem 'attr_extras', '~> 6.2', '>= 6.2.5'

  # AWS Ruby gem for Amazon Simple Storage Service
  # Read more: https://github.com/aws/aws-sdk-ruby
  gem 'aws-sdk-s3', '~> 1.114'

  # to optimize and cache expensive computations
  # Read more: https://github.com/Shopify/bootsnap
  gem 'bootsnap', '~> 1.12', require: true

  # Simple authorization solution for Rails. All permissions are stored in a single location.
  # Read more: https://github.com/CanCanCommunity/cancancan
  gem 'cancancan', '~> 3.4'

  # Unobtrusive nested forms handling, using jQuery
  # Read more: http://github.com/nathanvda/cocoon
  gem 'cocoon', '~> 1.2', '>= 1.2.15'

  # All sorts of useful information about every country packaged
  # Read more: https://github.com/countries/countries
  gem 'countries', '~> 5.1'

  # Create beautiful JavaScript charts with one line of Ruby
  gem 'chartkick', '~> 4.1', '>= 4.1.3'

  # Client Side Validations
  # Read more: https://github.com/DavyJonesLocker/client_side_validations
  gem 'client_side_validations', '~> 20.0', '>= 20.0.2'

  # Bundle and process CSS [https://github.com/rails/cssbundling-rails]
  gem 'cssbundling-rails', '~> 1.1'

  # Flexible authentication solution for Rails with Warden
  # Read more: https://github.com/heartcombo/devise
  gem 'devise', '~> 4.8', '>= 4.8.1'

  # Devise extension that checks user passwords against the PwnedPasswords
  # dataset https://haveibeenpwned.com/Passwords.
  # Read more: https://www.rubydoc.info/gems/devise-pwned_password/0.1.8
  gem 'devise-pwned_password', '~> 0.1.9'

  # An enterprise security extension for devise.
  # Read more: https://github.com/devise-security/devise-security
  gem 'devise-security', '~> 0.17.0'

  # Allows marking ActiveRecord objects as discarded,
  # and provides scopes for filtering.
  # Read more: https://rubygems.org/gems/discard
  gem 'discard', '~> 1.2'

  # Robust streaming downloads using Net::HTTP, HTTP.rb or wget.
  # Read more: https://github.com/janko/down
  gem 'down', '~> 5.3'

  # human-friendly strings as if they were numeric ids for ActiveRecord
  # Read more: http://norman.github.io/friendly_id/file.Guide.html
  gem 'friendly_id', '~> 5.4', '>= 5.4.2'

  # Object geocoding (by street or IP address)
  # Read more: https://github.com/alexreisner/geocoder
  gem 'geocoder', '~> 1.8'

  # Rails view helper for adding gravatars
  # Read more: http://github.com/mdeering/gravatar_image_tag
  gem 'gravatar_image_tag', '~> 1.2'

  # The simplest way to group temporal data
  gem 'groupdate', '~> 6.1'

  # Generate memorable random names to use in your apps or anywhere else.
  # Read more: https://github.com/usmanbashir/haikunator
  gem 'haikunator', '~> 1.1', '>= 1.1.1'

  # Find out which locale the user preferes by reading the languages
  # they specified in their browser
  # Read more: https://github.com/iain/http_accept_language
  gem 'http_accept_language', '~> 2.1', '>= 2.1.1'

  # Use Active Storage variant
  # Read more: https://github.com/janko/image_processing
  gem 'image_processing', '~> 1.12'

  # Use Active Storage variant
  # Read more: https://github.com/janko/image_processing
  gem 'inline_svg', '~> 1.8'

  # Build JSON APIs with ease [https://github.com/rails/jbuilder]
  gem 'jbuilder', '~> 2.11', '>= 2.11.5'

  # Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
  gem 'jsbundling-rails', '~> 1.0'

  # Loaf manages and displays breadcrumb trails in your Rails app. It aims to handle breadcrumb
  # data through easy dsl and expose it through view helpers without any assumptions about markup.
  gem 'loaf', '~> 0.10.0'

  # Search Engine Optimization (SEO)
  # Read more: http://github.com/kpumuk/meta-tags
  gem 'meta-tags', '~> 2.16'

  # This library provides integration of RubyMoney - Money gem with Rails
  # Read more: https://github.com/RubyMoney/money-rails
  gem 'money-rails', '~> 1.15'

  # Presenting names of people in full, familiar, abbreviated, and initialized forms
  # Read more: https://github.com/basecamp/name_of_person
  gem 'name_of_person', '~> 1.1', '>= 1.1.1'

  # Facebook OAuth2 Strategy for OmniAuth
  # Read more: https://github.com/simi/omniauth-facebook
  gem 'omniauth-facebook', '~> 9.0'

  # a mitigation against CVE-2015-9284
  gem 'omniauth-rails_csrf_protection', '~> 1.0', '>= 1.0.1'

  # Track changes to your rails models
  # Read more: http://github.com/airblade/paper_trail
  gem 'paper_trail', github: 'paper-trail-gem/paper_trail'

  # Plugin for the PaperTrail gem to track and reify associations
  # Read more: https://github.com/westonganger/paper_trail-association_tracking
  gem 'paper_trail-association_tracking', '~> 2.2', '>= 2.2.1'

  # fetch actual object who was responsible for this change
  # Read more: https://github.com/ankit1910/paper_trail-globalid
  gem 'paper_trail-globalid', '~> 0.2.0'

  # Use postgresql as the database for Active Record
  # Read more: http://deveiate.org/code/pg/
  gem 'pg', '~> 1.3'

  # Google libphonenumber library was taken as a basis for this gem.
  # Gem uses its data file for validations and number formatting.
  # Read more: https://github.com/daddyz/phonelib
  gem 'phonelib', '~> 0.7.0'

  # Fast, Nimble PDF Writer for Ruby
  # Read more: https://github.com/prawnpdf/prawn
  gem 'prawn', github: 'prawnpdf/prawn'

  # Use Puma as the app server
  # Read more: http://puma.io/
  gem 'puma', '~> 5.6'

  # Object oriented authorization for Rails applications
  # Read more: https://github.com/varvet/pundit
  gem 'pundit', '~> 2.2'

  # Ruby on Rails is a full-stack web framework optimized for programmer
  # happiness and sustainable productivity. It encourages beautiful code by
  # favoring convention over configuration.
  # Read more: http://rubyonrails.org/
  # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
  gem 'rails', '~> 7.0'

  # A set of common locale data and translations to internationalize
  # and/or localize your Rails applications.
  # Read more: https://github.com/svenfuchs/rails-i18n
  gem 'rails-i18n', '~> 7.0'

  # Use Redis adapter to run Action Cable in production
  gem 'redis', '~> 4.7'

  # Roles library without any authorization enforcement
  # Read more: https://github.com/RolifyCommunity/rolify
  gem 'rolify', '~> 6.0'

  # Rollup time-series data in Rails
  # Read more: https://github.com/ankane/rollup
  gem 'rollups', '~> 0.2.0'

  # rqrcode is a library for encoding QR codes.
  # Read more: https://github.com/whomwah/rqrcode
  gem 'rqrcode', '~> 2.1', '>= 2.1.1'

  # ruby-vips is a binding for the libvips image processing library
  # Read more: https://github.com/libvips/ruby-vips
  gem 'ruby-vips', '~> 2.1', '>= 2.1.4'

  # Use Sass to process CSS
  # gem "sassc-rails"

  # Simple, efficient background processing for Ruby
  # Read more: http://sidekiq.org/
  gem 'sidekiq', '~> 6.5'

  # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
  gem 'sprockets-rails', '~> 3.4', '>= 3.4.2'

  # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
  gem 'stimulus-rails', '~> 1.0'

  # Accurate current and historical timezones for Ruby with support for Geonames
  # Read more: https://github.com/panthomakos/timezone
  gem 'timezone', '~> 1.3'

  # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
  gem 'turbo-rails', '~> 1.1'

  # ### Features ### * control sms code pattern * configure max login attempts *
  # per user level control if he really need two factor authentication * your own sms logic
  # Read more: https://github.com/Houdini/two_factor_authentication
  gem 'two_factor_authentication', github: 'reckerswartz/two_factor_authentication', branch: 'patch-1'

  # Turbolinks makes navigating your web application faster.
  # Read more: https://github.com/turbolinks/turbolinks
  gem 'valid_email2', '~> 4.0'

  # Ruby C bindings to the excellent Yajl JSON stream-based parser library.
  # Read more: http://github.com/brianmario/yajl-ruby
  gem 'yajl-ruby', '~> 1.4'
end

group :development, :test do
  # help to kill N+1 queries and unused eager loading
  # Read more: https://github.com/flyerhzm/bullet
  gem 'bullet', '~> 7.0'

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # Extracting `assigns` and `assert_template` from ActionDispatch.
  # Read more:  https://github.com/rails/rails-controller-testing
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
end

group :development, :test, :staging do
  # factory_bot_rails provides integration between factory_bot
  # Read more: https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails', '~> 6.2'

  # easily generate fake data: names, addresses, phone numbers, etc.
  # Read more: https://github.com/stympy/faker
  gem 'faker', '~> 2.21'
end

group :development do
  # Annotate Rails classes with schema and routes info
  # Read more: https://github.com/ctran/annotate_models
  gem 'annotate', '~> 3.2'

  # Better HTML for Rails. Provides sane html helpers that make it easier to do the right thing.
  # Read more: https://github.com/Shopify/better-html
  gem 'better_html', '~> 1.0', '>= 1.0.16'

  # Brakeman detects security vulnerabilities in Ruby on Rails applications
  # via static analysis.
  # Read more: https://brakemanscanner.org/
  gem 'brakeman', '~> 5.2', require: false

  # Capistrano is a utility and framework for executing commands in parallel on multiple
  gem 'capistrano', '~> 3.17', require: false
  gem 'capistrano-passenger', '~> 0.2.1', require: false
  gem 'capistrano-rails', '~> 1.6', require: false
  gem 'capistrano-rake', '~> 0.2.0', require: false
  gem 'capistrano-rvm', '~> 0.1.2', require: false

  # ERB Linter tool.
  # Read more: https://github.com/Shopify/erb-lint
  gem 'erb_lint', '~> 0.1.3', require: false

  # Preview mail in the browser instead of sending
  # Read more: http://www.rubydoc.info/gems/letter_opener
  gem 'letter_opener', '~> 1.8'

  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code.
  # Read more:
  gem 'web-console', '~> 4.1'

  # prettier plugin for the Ruby programming language
  # Read more: https://github.com/prettier/plugin-ruby#readme
  gem 'prettier', '~> 3.1'

  # Pronto runs analysis quickly by checking only the relevant changes
  # Read more: https://github.com/prontolabs/pronto
  gem 'pronto', '~> 0.11.0'
  gem 'pronto-brakeman', '~> 0.11.0', require: false
  gem 'pronto-erb_lint', github: 'tleish/pronto-erb_lint', require: false
  gem 'pronto-rails_best_practices', '~> 0.11.0', require: false
  gem 'pronto-reek', '~> 0.11.0', require: false
  gem 'pronto-rubocop', '~> 0.11.1', require: false
  gem 'pronto-stylelint', '~> 0.10.2', require: false

  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 3.0'

  # rails_best_practices is a code metric tool to check the quality of Rails code
  # Read more: http://rdoc.rails-bestpractices.com/
  gem 'rails_best_practices', '~> 1.23', require: false

  # Generate and install a favicon for all platforms with RealFaviconGenerator.
  # Read more: https://github.com/RealFaviconGenerator/rails_real_favicon
  gem 'rails_real_favicon', '~> 0.1.1', require: false

  # Tool that examines Ruby classes, modules and methods
  # Read more: http://www.rubydoc.info/gems/reek
  gem 'reek', '~> 6.1', require: false

  # rspec-rails is a testing framework for Rails
  # Read more: https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '~> 5.1'

  # Automatic Ruby code style checking tool
  # Read more: https://docs.rubocop.org/
  gem 'rubocop', '~> 1.30', require: false
  gem 'rubocop-performance', '~> 1.14', require: false
  gem 'rubocop-rails', '~> 2.15'
  gem 'rubocop-rspec', '~> 2.11', require: false

  # Shoulda Matchers provides RSpec- and Minitest-compatible
  # one-liners to test common Rails functionality that
  # Read more: https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 5.1'

  # Catch unsafe migrations at dev time
  # Read more: http://www.rubydoc.info/gems/strong_migrations/
  gem 'strong_migrations', github: 'ankane/strong_migrations'
end
