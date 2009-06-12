require File.join(File.dirname(__FILE__) + "/env")

describe "Memoria" do
  it "should get '/'" do
    get "/"
    @response.status.should == 200
  end
end