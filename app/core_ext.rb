Dir["#{File.dirname(__FILE__)}/core_ext/*.rb"].each {|r| require r}

class Numeric
  include Memoria::Bytes
end
