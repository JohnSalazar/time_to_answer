# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "time_to_answer"
set :repo_url, "https://github.com/JohnSalazar/time_to_answer.git"
set :deploy_to, "/var/www/time_to_answer"
set :branch, 'master'
set :keep_releases, 5
set :format, :airbrussh
set :log_level, :debug
# set :rvm_custom_path, '/usr/share/rvm'
append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "storage", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

after 'deploy:finished', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end
