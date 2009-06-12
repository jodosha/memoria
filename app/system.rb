class System
  class << self
    def stats
      result = []
      stats = execute_command %(ps -axcr -o "pid,pcpu,pmem,time,comm" | grep redis)
      stats.split(/\s+/).each_slice(5) do |a|
        result << { :pid => a[0], :cpu => a[1], :memory => a[2], :time => a[3] }
      end
      result
    end

    def execute_command(command)
      `#{command}`
    end
  end
end