require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rbenv'
require 'capistrano/rbenv_install'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/nginx_unicorn'
require 'capistrano/sidekiq'
require 'whenever/capistrano'
require 'capistrano/rails/console'
require 'capistrano/postgresql'
require 'airbrussh/capistrano'

# Load custom tasks from `lib/capistrano/tasks' if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
