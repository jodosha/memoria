class Server
  BLANK_STATS = {
    :servers_count            => 0,
    :servers_alive            => 0,
    :used_memory              => 0,
    :total_connections        => 0,
    :current_connections      => 0,
    :total_commands_processed => 0
  }.freeze
  
  include DataMapper::Resource

  property :id,   Serial
  property :name, String, :key => true
  property :host, String
  property :port, String

  validates_present :name, :host, :port

  class << self
    def overall_stats
      all.inject(BLANK_STATS.dup) do |result, server|
        result[:servers_count]              += 1
        if server.alive?
          result[:servers_alive]            += 1
          result[:used_memory]              += server.used_memory.to_i
          result[:total_connections]        += server.total_connections_received.to_i
          result[:current_connections]      += server.connected_clients.to_i
          result[:total_commands_processed] += server.total_commands_processed.to_i
        end
        result
      end
    end
  end

  def alive?
    return true if stats
  rescue
    @connection = nil
    false
  end

  def stats
    @stats ||= connection.info
  end

  def method_missing(method_name, *args)
    if result = stats[method_name.to_sym]
      result
    else
      super
    end
  end

  private
    def connection
      @connection ||= Redis.new :host => host, :port => port
    end
end