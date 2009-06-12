module Memoria  
  class << self
    def new
      Sinatra::Application
    end
  end
end