namespace :provisions do

  packages = %w(
    git
    autoconf
    bison
    build-essential
    libssl-dev
    libyaml-dev
    libreadline6
    libreadline6-dev
    zlib1g
    zlib1g-dev
    libpq-dev
    postgresql
    postgresql-contrib
    nodejs
    nginx
    unicorn
  )

  desc 'Installs all the necessary libraries and basic setup'
  task :install do
    puts callbacks
    transaction do
      install_packages
      # add_deploy_user
    end
  end

  desc 'Installs all the necessary libraries'
  task :install_packages do
    apt_update
    apt_install("#{packages.join(' ')}")
  end

  desc 'Adds the deploy user with necessary priviligies'
  task :add_deploy_user do
    # run "bash -c \"echo 'SHELL=/bin/bash' > /etc/default/useradd\""
    run "useradd -m #{deploy_user}"
    run "mkdir -p #{deploy_to}"
    run "chown -R #{user}:#{deploy_user} #{deploy_to}"
    run "chmod -R g+w #{deploy_user} #{deploy_to}"
  end

  def apt_update
    run "#{sudo} apt-get -y update"
  end

  def apt_install(packages)
    run "#{sudo} apt-get install -y #{packages}"
  end
end
