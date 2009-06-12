require File.join(File.dirname(__FILE__) + "/env")

describe "Memoria" do
  describe "GET '/'" do
    it "should be successful" do
      get "/"
      @response.status.should == 200
    end
  end

  describe "POST '/servers'" do
    it "should be successful" do
      post "/servers", server_params
      @response.status.should == 302
    end

    it "should not save on invalid server" do
      post "/servers", server_params(:name => nil)
      @response.status.should == 200
    end
  end

  private
    def server_params(options = {})
      { :server => { :name => "master", :host => "127.0.0.1", :port => "6379" }.merge(options) }
    end
end