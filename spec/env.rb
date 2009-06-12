require "rubygems"
require "sinatra"
require "sinatra/test/rspec"
require "mocha"

root = File.join(File.dirname(__FILE__), '..')

require "#{root}/memoria"

Memoria.new(File.join(File.dirname(__FILE__), '..', 'memoria.yml'))
DataMapper.auto_migrate!

set :views,  "#{root}/views"
