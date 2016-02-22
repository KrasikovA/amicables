# config valid only for current version of Capistrano

set :application, 'amicables'
set :repo_url, 'git@github.com:KrasikovA/amicables.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deployer/apps/amicables'
server '192.168.1.70', user: 'deployer'
set :keep_releases, 2

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# 

namespace :deploy do
  run 'kill cat /home/deployer/apps/amicables/run/unicorn.pid'
  within release_path do
    execute :bundle, "--without development test"
    execute :rake, 'db:migrate'
    run 'unicorn -c config/unicorn.rb -e production -D'
  end

end
