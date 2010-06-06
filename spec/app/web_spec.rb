require File.join(File.dirname(__FILE__), "..", "env")

describe "web" do
  before :each do
    @request = Rack::MockRequest.new($app)
  end

  describe "GET '/'" do
    it "should be successful" do
      response = @request.get '/'
      response.should be_ok
    end
  end

  describe "POST '/servers'" do
    it "should be successful" do
      response = @request.post '/servers', server_params
      response.should be_redirect
    end

    it "should not save on invalid server" do
      response = @request.post '/servers', server_params(:name => nil)
      response.should be_ok
    end
  end

  private
    def server_params(options = {})
      { :params => { :server => { :name => "master", :host => "127.0.0.1", :port => "6379" }.merge(options) } }
    end
end