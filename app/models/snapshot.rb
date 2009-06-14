class Snapshot
  include DataMapper::Resource

  property   :id,                         Serial
  belongs_to :server
  property   :alive,                      Boolean
  property   :used_memory,                Integer
  property   :total_connections_received, Integer
  property   :connected_clients,          Integer
  property   :total_commands_processed,   Integer
  property   :created_at,                 DateTime
end