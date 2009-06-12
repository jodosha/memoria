class Server
  PONG = "PONG".freeze
  include DataMapper::Resource

  property :id,   Serial
  property :name, String, :key => true
  property :host, String
  property :port, String

  validates_present :name, :host, :port

  def alive?
    connection.ping == PONG
  rescue
    @connection = nil
    false
  end

  private
    def connection
      @connection ||= Redis.new :host => host, :port => port
    end
end