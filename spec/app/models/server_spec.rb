require File.join(File.dirname(__FILE__), "..", "..", "env")

describe "Server" do
  describe "validations" do
    it "should be valid" do
      server = Server.new attributes
      server.should be_valid
    end

    it "should validate presence of name" do
      server = Server.new attributes(:name => nil)
      server.should_not be_valid
    end

    it "should validate presence of host" do
      server = Server.new attributes(:host => nil)
      server.should_not be_valid
    end

    it "should validate presence of port" do
      server = Server.new attributes(:port => nil)
      server.should_not be_valid
    end

    it "should have alphanumeric name" do
      server = Server.new attributes(:name => "@23")
      server.should_not be_valid
    end

    it "should have canonical host format" do
      server = Server.new attributes(:host => "host.com/?param1=value1")
      server.should_not be_valid
    end

    it "should have numerical port format" do
      server = Server.new attributes(:host => ":6379")
      server.should_not be_valid
    end
  end

  it "should return a status" do
    server = Server.new attributes
    server.should_not be_alive
  end

  private
    def attributes(options = {})
      { :name => "master", :host => "127.0.0.1", :port => "6379" }.merge(options)
    end
end