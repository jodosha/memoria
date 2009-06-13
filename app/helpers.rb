Dir["#{File.dirname(__FILE__)}/helpers/*.rb"].each {|r| require r}

module Memoria
  module Helpers
    include Number
    
    include Rack::Utils
    alias :h :escape_html
  end
end