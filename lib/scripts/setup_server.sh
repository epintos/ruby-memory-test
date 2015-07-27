#!/bin/sh

# Check for correct number of arguments
if [ $# -ne 5 ]; then
  echo "Usage: $0 <root-user> <deploy-user> <ip> <port> <app>"
  exit 1
fi

# Set variables
ROOT_USER=$1
DEPLOY_USER=$2
IP=$3
PORT=$4
APP=$5

# Generate secret pair key for app
ssh-keygen -t rsa -N "" -f ~/.ssh/$APP
chmod 600 ~/.ssh/$APP.pub
chmod 600 ~/.ssh/$APP

# Upload key for root
ssh-copy-id -i ~/.ssh/$APP.pub $ROOT_USER@$IP

# Install chef in server
cd config/chef && knife solo prepare $ROOT_USER@$IP

# Execute the run list in server
knife solo cook $ROOT_USER@$IP

# Upload key for deploy user
ssh-copy-id -i ~/.ssh/$APP.pub -p $PORT $DEPLOY_USER@$IP

# Setup app services
cd ../..

# Setup NGINX. It will install Rbenv the first time
bundle exec cap production nginx:setup

# Setup Unicorn
bundle exec cap production unicorn:setup_initializer
bundle exec cap production unicorn:setup_app_config

# Finish with posgresql setup
bundle exec cap production postgresql:generate_database_yml_archetype
bundle exec cap production postgresql:generate_database_yml

# Deploy app
bundle exec cap production deploy

echo 'Deploy finished. Set SECRET_KEY_BASE environment variable to start the server.'
