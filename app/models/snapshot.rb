class Snapshot
  include DataMapper::Resource

  property   :id,                         Serial
  belongs_to :server
  property   :alive,                      Boolean
  property   :process_id,                 Integer, :default => 0
  property   :used_memory,                Integer, :default => 0
  property   :used_memory_human,          String
  property   :vm_enabled,                 Boolean, :default => false
  property   :arch_bits,                  String
  property   :role,                       String
  property   :connected_clients,          Integer, :default => 0
  property   :total_connections_received, Integer, :default => 0
  property   :connected_slaves,           Integer, :default => 0
  property   :bgsave_in_progress,         Boolean
  property   :last_save_time,             Integer
  property   :uptime_in_days,             Integer
  property   :uptime_in_seconds,          Integer
  property   :total_commands_processed,   Integer, :default => 0
  property   :changes_since_last_save,    Integer, :default => 0
  property   :redis_version,              String
  property   :multiplexing_api,           String
  property   :created_at,                 Time
end
