$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "/../lib")))
ARGV << "-b"
require "rubygems"
require "bundler"
Bundler.setup

require "sinatra"
# require "sinatra/test/rspec"
require "mocha"

Sinatra::Application.environment = :test

root = File.join(File.dirname(__FILE__), '..')
require "#{root}/memoria"

Memoria.new false
DataMapper.auto_migrate!
Server.create! :name => "single", :host => "127.0.0.1", :port => "6379"

set :views,  "#{root}/views"
