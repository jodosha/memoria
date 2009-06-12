require File.join(File.dirname(__FILE__), "..", "..", "env")

describe "Server" do
  describe "validations" do
    it "should validate presence of name" do
      server = Server.new attributes(:name => nil)
      server.save.should be_false
    end

    it "should validate presence of host" do
      server = Server.new attributes(:host => nil)
      server.save.should be_false
    end

    it "should validate presence of port" do
      server = Server.new attributes(:port => nil)
      server.save.should be_false
    end
  end
  
  private
    def attributes(options = {})
      { :name => "master", :host => "127.0.0.1", :port => "6379" }.merge(options)
    end
end