set :stage, :production

role :app, %w(deployer@192.155.242.51)
role :web, %w(deployer@192.155.242.51)
role :db,  %w(deployer@192.155.242.51)

set :bundle_binstubs, -> { shared_path.join('bin') }

set :ssh_options, forward_agent: true,
                  user: fetch(:deploy_user),
                  keys: %w(~/.ssh/soft-layer)

set :nginx_server_name, '192.155.242.51'
