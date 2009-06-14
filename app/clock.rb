class Clock
  @@mutex = Mutex.new

  class << self
    def run(timeout = 30)
      # TODO find a proper way to execute in background without forking
      fork do
        EventMachine.run do
          EventMachine::PeriodicTimer.new(timeout) do
            servers.each do |server|
              EventMachine.defer proc { server.write_statistics }
            end
          end
        end
      end
    end

    def servers
      @@mutex.synchronize do
        @@servers ||= Server.all
      end
    end
  end
end