module Memoria
  class << self
    def new(start_clock = true, clock_interval = 30)
      data_mapper_setup
      Clock.run(clock_interval) if start_clock
      Sinatra::Application
    end

    def data_mapper_setup
      DataMapper.setup(:default, config[:db])
    end

    protected
      def config
        @config ||= YAML.load_file(config_path)[Sinatra::Application.environment]
      end
      
      def config_path
        @config_path ||= File.expand_path(File.join(File.dirname(__FILE__), "..", "memoria.yml"))
      end
  end
end