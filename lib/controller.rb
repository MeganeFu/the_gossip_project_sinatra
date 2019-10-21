require 'gossip'
require 'csv'

class ApplicationController < Sinatra::Base
 
  get '/gossips/new/' do
    erb :new_gossip
	end
	
	get '/' do
  erb :index, locals: {gossips: Gossip.all}
end
	
		get '/gossips/edit' do
		erb :edit
			
#			Gossip.new(params["gossip_author"], params["gossip_content"]).save
##			
	end


 
	
	get '/gossips/:id' do 
	erb :show, locals: {gossips: Gossip.find(params["id"]), id: params["id"] }
end 
	

	
 post '/gossips/new/' do

	 Gossip.new(params["gossip_author"], params["gossip_content"]).save 
	 redirect '/'
end
  end