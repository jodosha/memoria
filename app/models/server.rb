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
  has n, :snapshots

  validates_present :name, :host, :port
  validates_format  :name, :with => /^[0-9a-z]*$/i
  validates_format  :host, :with => /^[0-9a-z\.]*$/i

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

  def write_statistics
    if alive?
      self.snapshots.create :alive  => true,
        :used_memory                => used_memory.to_i,
        :total_connections_received => total_connections_received.to_i,
        :total_commands_processed   => total_commands_processed.to_i,
        :connected_clients          => connected_clients.to_i,
        :created_at                 => Time.now
    else
      self.snapshots.create :alive => false, :created_at => Time.now
    end
    @stats = nil
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