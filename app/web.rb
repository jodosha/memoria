get "/" do
  @stats = System.stats
  erb :index
end