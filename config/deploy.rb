require 'rvm/capistrano'
require 'bundler/capistrano'

# RVM environment
set :rvm_ruby_string, "ruby-1.9.3-p392@global"

server "194.190.225.173", :web, :app, :db, primary: true

set :user, "tpark"
set :application, "technopark"
set :deploy_to, "/home/tpark/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:babrovka/technopark.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true


namespace(:customs) do
  task :restart do
    run "#{current_path}/thin restart"
   end
end


after "deploy", "deploy:cleanup" # keep only the last 5 releases
after "deploy:cleanup", "customs:restart"