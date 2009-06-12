class Server
  include DataMapper::Resource
  
  property :id,   Serial
  property :name, String, :key => true
  property :host, String
  property :port, String

  validates_present :name, :host, :port
end