# Update package database
execute "apt-get update"

# Install packages
package "git"
package "autoconf"
package "bison"
package "build-essential"
package "libssl-dev"
package "libyaml-dev"
package "libreadline6"
package "libreadline6-dev"
package "zlib1g"
package "zlib1g-dev"
package "libpq-dev"
package "nodejs"
package "nginx"
package "unicorn"
package "vim"

# set timezone
bash "set timezone" do
  code <<-EOH
    echo 'Etc/UTC' > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata
  EOH
  not_if "date | grep -q 'UTC'"
end
