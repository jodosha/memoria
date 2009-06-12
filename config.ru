require File.join(File.dirname(__FILE__), 'memoria')

set :run, false
set :environment, :production
set :raise_errors, true

run Memoria.new