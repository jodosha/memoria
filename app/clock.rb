class Clock
  class << self
    def run(interval = 30)
      # TODO find a proper way to execute in background without forking
      fork do
        EventMachine.run do
          EventMachine::PeriodicTimer.new(interval) do
            Server.all.each do |server|
              EventMachine.defer proc { server.write_statistics }
            end
          end
        end
      end
    end
  end
end