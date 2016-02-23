# config valid only for current version of Capistrano

set :application, 'amicables'
set :repo_url, 'git@github.com:KrasikovA/amicables.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deployer/apps/amicables'
server '192.168.1.70', user: 'deployer'
set :keep_releases, 2
set :rvm_type, :user   
set :rvm_ruby_version, '2.2.3'
set :default_env, {
  'SECRET_KEY_BASE' => SecureRandom.hex(64)
}
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


namespace :deploy do
  task :reboot do
    on roles(:all) do
      unicorn_pid = capture "cat /home/deployer/apps/amicables/run/unicorn.pid"
      execute :kill, "#{unicorn_pid}"
      within release_path do
        execute :bundle,"install --without development test"
        execute :bundle,"exec unicorn -c config/unicorn.rb -E production -D"
      end
    end
  end
  after "deploy:finished", "deploy:reboot"
end
