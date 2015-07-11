source 'https://rubygems.org'

ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'slim'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'rails_12factor', group: :production

gem 'newrelic_rpm', group: :production

gem 'bullet', group: 'development'
gem 'skylight'
gem 'rack-mini-profiler'

gem 'whenever', require: false

# Sidekiq
gem 'sidekiq'
gem 'sinatra', '>= 1.3.0', require: nil
gem 'sidekiq-failures'
gem 'sidekiq_mailer'

group :development do
  gem 'capistrano', '3.2.1'
  gem 'capistrano-maintenance', github: 'capistrano/maintenance', require: false
  gem 'capistrano-rails'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-rbenv-install', '~> 1.2.0'
  gem 'capistrano-nginx-unicorn'
  gem 'capistrano-sidekiq'
  gem 'capistrano-rails-console'
  gem 'capistrano-postgresql', '~> 4.2.0'
  gem 'airbrussh', require: false
end

