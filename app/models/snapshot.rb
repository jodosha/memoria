class Snapshot
  include DataMapper::Resource

  property   :id,                         Serial
  belongs_to :server
  property   :alive,                      Boolean
  property   :used_memory,                Integer, :default => 0
  property   :total_connections_received, Integer, :default => 0
  property   :connected_clients,          Integer, :default => 0
  property   :total_commands_processed,   Integer, :default => 0
  property   :created_at,                 DateTime
end