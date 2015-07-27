# Config valid only for Capistrano 3.2.1
lock '3.2.1'

set :application, 'ruby-memory-test'
set :repo_url, 'git@github.com:epintos/ruby-memory-test.git'
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :scm, :git

set :deploy_user, 'deployer'

set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:application)}"

set :log_level, :info

set :linked_dirs, %w(bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system)

# False is required for sidekiq to work
set :pty, false
set :sidekiq_processes, 5

set :use_sudo, 'false'

set :keep_releases, 5

set :pg_user, fetch(:deploy_user)
set :pg_ask_for_password, true
set :pg_database, fetch(:application)

set :default_env, { rails_env: 'PRODUCTION' }

set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'

set :unicorn_user, fetch(:deploy_user)
set :unicorn_error_log, "#{shared_path}/log/unicorn_error.log"
set :unicorn_workers, 4

set :bundle_jobs, 10

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

after 'deploy:publishing', 'deploy:restart'
after 'deploy:restart', 'sidekiq:restart'
