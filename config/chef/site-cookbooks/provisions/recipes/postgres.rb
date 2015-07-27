package "postgresql"
package "postgresql-contrib"

# change postgres password
execute "change postgres password" do
  user "postgres"
  command "psql -c \"alter user postgres with password '#{node['db']['root_password']}';\""
end

# create new postgres user
execute "create new postgres user" do
  user "postgres"
  command "psql -c \"create role #{node['db']['user']['name']} login createdb superuser replication password '#{node['db']['user']['password']}';\""
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_roles WHERE rolname='#{node['db']['user']['name']}'\" | wc -l`.chomp == "1" }
end

# create new postgres database
execute "create new postgres database" do
  user "postgres"
  createdb = <<-EOH
    psql -c 'create database "#{node[:app]}" owner #{node[:db][:user][:name]};'
  EOH
  command createdb
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_database WHERE datname='#{node['app']}'\" | wc -l`.chomp == "1" }
end
