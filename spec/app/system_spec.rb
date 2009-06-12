require File.join(File.dirname(__FILE__) + "/../env")

describe "System" do
  it "should return stats" do
    System.stubs(:execute_command).returns raw_redis_stats
    System.stats.should == redis_stats
  end

  private
    def redis_stats
      [{ :pid => "39297", :cpu => "0.0", :memory => "0,0", :time => "0:00.08" }]
    end

    def raw_redis_stats
      "39297   0.0  0,0   0:00.08 redis-server"
    end
end