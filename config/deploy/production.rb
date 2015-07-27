set :stage, :production

role :app, ["#{fetch(:deploy_user)}@192.155.242.50"]
role :web, ["#{fetch(:deploy_user)}@192.155.242.50"]
role :db,  ["#{fetch(:deploy_user)}@192.155.242.50"]

set :bundle_binstubs, -> { shared_path.join('bin') }

set :ssh_options, forward_agent: true,
                  user: fetch(:deploy_user),
                  keys: ["~/.ssh/#{fetch(:application)}"]

set :nginx_server_name, '192.155.242.50'
