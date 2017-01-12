require 'colorize'

class Room
	attr_accessor :description, :valid_outs, :item
	def initialize(desc)
		found_out = false
		@description = desc
		@valid_outs = {}
		@item = {}
	end

	def add_item(item)
		item.each { |n,u| @item[n] = u }
	end

	def add_outs(outs)
		outs.each { |d,r| @valid_outs[d] = r }
	end

	def is_valid_out?(direction)
		@success = false
		if @valid_outs.key?(direction.to_sym)
			puts "Great!! Good try!!"
			@success = true;
			@found_out =true;
		else
			puts "Argggg!! Bad option!!"
		end
		@success		
	end

	def get_next(direction)
		if @found_out
			@valid_outs[direction.to_sym]
		else
			self
		end
	end	

	def has_item?
		@item.empty? ? false : true		
	end
end