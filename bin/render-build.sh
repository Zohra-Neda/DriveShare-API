#!/usr/bin/env bash

# Disable database environment check
export DISABLE_DATABASE_ENVIRONMENT_CHECK=1
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
bundle exec rake db:seed
