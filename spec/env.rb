require "rubygems"
require "sinatra"
require "sinatra/test/rspec"
require "mocha"

root = File.join(File.dirname(__FILE__), '..')

require "#{root}/memoria"

Memoria.new(File.join(File.dirname(__FILE__), '..', 'memoria.yml'))
DataMapper.auto_migrate!
Server.create! :name => "single", :host => "127.0.0.1", :port => "6379"

set :views,  "#{root}/views"
