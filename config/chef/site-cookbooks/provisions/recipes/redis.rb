package "tcl8.5"

# Download Stable Redis
remote_file "/home/#{node['user']['name']}/redis-stable.tar.gz" do
  source "http://download.redis.io/redis-stable.tar.gz"
  mode 0644
  action :create_if_missing
end

# Install Stable Redis
bash 'install redis' do
  cwd "/home/#{node['user']['name']}"
  code <<-EOH
    tar xvzf redis-stable.tar.gz
    cd redis-stable
    make && make install
    echo -n | utils/install_server.sh
  EOH
  not_if { File.exists?("/usr/local/bin/redis-server") }
end
