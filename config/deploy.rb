# General
ssh_options[:keys] = ["#{ENV['HOME']}/AWS/defindex.pem"]
set :application, "eulerdesigner"
set :user, "ubuntu"
set :domain, 'defindex.com.br'

set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :copy

set :use_sudo, false


# Bundler

require "bundler/capistrano"
#load 'deploy/assets'

# RVM

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, "1.9.2"
set :rvm_type, :user

# Git

set :scm, :git
set :repository,  "."
set :deploy_via, :copy
set :branch, "master"

# VPS

role :web, domain
role :app, domain
role :db,  domain, :primary => true

# Passenger

namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end

end
