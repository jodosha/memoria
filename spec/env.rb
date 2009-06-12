require "rubygems"
require "sinatra"
require "sinatra/test/rspec"
require "mocha"

root = File.join(File.dirname(__FILE__), '..')

require "#{root}/memoria"

set :views,  "#{root}/views"
