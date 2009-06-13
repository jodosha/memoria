helpers do
  include Memoria::Helpers
end

get "/" do
  @stats = Server.overall_stats
  erb :index
end

get "/servers/new" do
  erb :new
end

post "/servers" do
  @server = Server.new(params[:server])
  if @server.save
   redirect "/"
  else
    erb :new
  end
end