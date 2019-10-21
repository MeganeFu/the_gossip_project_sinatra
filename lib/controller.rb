require 'gossip'
require 'csv'

class ApplicationController < Sinatra::Base
 
  get '/gossips/new/' do
    erb :new_gossip
	end
	
	get '/' do
  erb :index, locals: {gossips: Gossip.all}
end
	
 post '/gossips/new/' do

	 Gossip.new(params["gossip_author"], params["gossip_content"]).save 
	 redirect '/'
end
	
	
   
  end