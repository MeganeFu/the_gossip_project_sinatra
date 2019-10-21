require 'gossip'
require 'csv'

class ApplicationController < Sinatra::Base
 
  get '/gossips/new/' do
    erb :new_gossip
	end
	
	get '/' do
  erb :index, locals: {gossips: Gossip.all}
end
	
	
	get '/gossips/:id' do 
		
  erb :index, locals: {gossips: Gossip.find(params["id"])}

  end 
	
	
 post '/gossips/new/' do

	 Gossip.new(params["gossip_author"], params["gossip_content"]).save 
	 redirect '/'
end
	
	
#		@gossip_content = all_gossips.select do |gossip_content|
#	gossip_content.id == params[:id]
#		end.first
#		erb :http://localhost:4567/gossips/id/
#	end

  end