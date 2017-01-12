require 'colorize'

class Player
	attr_reader :lifes
	def initialize(lifes)
		@lifes = lifes
		@bag ={}
	end

	def lose_life
		@lifes -=1	
		if @lifes > 0
			puts "You have only #{@lifes} more"
		else 
			puts "You are died!!"
		end	
	end

	def view_item(room)
		if room.has_item?
			print "Item in the room:"
			room.item.each {|n, u| puts "#{n.to_s.colorize(:red)} for #{u}"}	
		else
			puts "Empty room"
		end	
	end

	def take_item(room)
		room.item.each do |n, u| 
			@bag[n] = u	
			room.item.delete(n)
		end
	end

	def release_item(room)		
		@bag.each do |n, u| 
			room.item[n] = u	
			@bag.delete(n)
		end		
	end

	def print_own_items
		@bag.each {|n, u| puts "Now, you have a #{n.to_s.colorize(:red)} for #{u}"}	
	end

	def has_item?
		@bag.empty? ? false : true			
	end
	
end