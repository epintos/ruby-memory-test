# create group
group node['group']

# create user and add to group
user node['user']['name'] do
  gid node['group']
  home "/home/#{node['user']['name']}"
  password node['user']['password']
  shell "/bin/bash"
  supports manage_home: true # need for /home creation
end

# give group sudo privileges
bash "give group sudo privileges" do
  code <<-EOH
    sed -i '/%#{node['group']}.*/d' /etc/sudoers
    echo '%#{node['group']} ALL = (ALL) NOPASSWD: /bin/mv /tmp/nginx_#{node['app']}_production /etc/nginx/sites-available/#{node['app']}_production' >> /etc/sudoers
    echo '%#{node['group']} ALL = (ALL) NOPASSWD: /bin/ln -fs /etc/nginx/sites-available/#{node['app']}_production /etc/nginx/sites-enabled/#{node['app']}_production' >> /etc/sudoers
    echo '%#{node['group']} ALL = (ALL) NOPASSWD: /bin/mv /tmp/unicorn_init /etc/init.d/unicorn_#{node['app']}_production' >> /etc/sudoers
    echo '%#{node['group']} ALL = (ALL) NOPASSWD: /usr/sbin/update-rc.d -f unicorn_#{node['app']}_production defaults' >> /etc/sudoers
    echo '%#{node['group']} ALL = (ALL) NOPASSWD: /etc/init.d/nginx reload' >> /etc/sudoers
    echo '%#{node['group']} ALL = (ALL) NOPASSWD: /usr/sbin/service unicorn_#{node['app']}_production restart' >> /etc/sudoers
    echo '%#{node['group']} ALL = (ALL) NOPASSWD: sudoedit /etc/environment' >> /etc/sudoers
  EOH
  not_if "grep -xq '%#{node['group']}' /etc/sudoers"
end
