require 'pry'
require 'csv'

class Gossip
	
	
	attr_accessor :gossip_author, :gossip_content
	
	def initialize (gossip_author,gossip_content)
		@gossip_author = gossip_author
		@gossip_content = gossip_content
		
		
	end
	
	
def save #cette methode range chaque gossip dans une ligne du fichier csv
  CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@gossip_author, @gossip_content]
  end
end
	
	
	def self.all #classe les gossips dans un array
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
	
  return all_gossips
end

def self.find(id) #permet de retourner un gossip en fonction de son id 
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
	
  return [all_gossips[id.to_i]]
end
	
end

