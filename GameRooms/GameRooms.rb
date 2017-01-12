require 'colorize'
require_relative 'Room'
require_relative 'Player'
require_relative 'Item'

class GameRooms

	def initialize(player)
		@map = []
		@current_room = nil
		@player = player
		@movements = 0
		create_map
		#print_map
		start_game
	end

	private
	def add_room_to_map(room)
		@map.push room
	end

	def create_map()
		room1  = Room.new("A1")
		room2  = Room.new("A2")
		room3  = Room.new("A3")
		room4  = Room.new("B1")
		room5  = Room.new("B3")
		room6  = Room.new("C1")
		room7  = Room.new("C2")
		room8  = Room.new("C3")
		room9  = Room.new("C4")
		room10  = Room.new("D1")
		room11 = Room.new("E1")
		room12 = Room.new("E2")

		room1.add_outs({"E": "FINISH","W": room2})
		room2.add_outs({"E": room1,"W": room3})
		room3.add_outs({"E": room2,"N": room5})
		room4.add_outs({"N": room6,"S": room1})
		room5.add_outs({"N": room8,"S": room3})
		room6.add_outs({"S": room4,"N": room10,"W": room7})
		room7.add_outs({"W": room8,"E": room6})
		room8.add_outs({"W": room9,"E": room7,"S": room3})
		room9.add_outs({"E": room8})
		room10.add_outs({"S": room6,"N": room11})
		room11.add_outs({"W": room12,"S": room10})
		room12.add_outs({"E": room11})


		room11.add_item({"key": "Open doors"})
		room5.add_item({"sword": "Kill monsters"})
		room1.add_item({"monster": "Kill player"})


		for i in 1..12
   			add_room_to_map(eval("room#{i}"))
		end
	end

	def print_map
		@map.each { |room| puts room.description }
	end

	def start_game
		puts "Game loading....."
		sleep(2)

		@finish = false
		@current_room = @map[@map.size-1]

		while (!@finish && @player.lifes>0)
			@movements += 1

			puts "You are in the room #{@current_room.description.to_s.colorize(:blue)}."
			puts "In which direction do you want to move? [N, W, S, E]"

			move_player(gets.chomp)

			if @current_room == "FINISH"
				@finish = true
			end
		end

		finish_game
	end

	def move_player(direction)
		if @current_room.is_valid_out?(direction)
				@current_room = @current_room.get_next(direction)
				@player.view_item(@current_room)
				ask_for_take_item
				ask_for_release_item
			else
				@player.lose_life
			end		
	end

	def ask_for_take_item
		if @current_room.has_item?
					puts "Do you want to take any item? [Y/N]"
					if gets.chomp == "Y"
						@player.take_item(@current_room)
					end
				end
	end

	def ask_for_release_item
		if @player.has_item?
			@player.print_own_items
			puts "Do you want to release any item? Write its name, if not press Enter."
			item_name = gets.chomp
			if item_name != "" && item_name.size > 2
				@player.release_item(@current_room)
			end
		end
	end

	def finish_game		
		if @player.lifes>0 
			puts "####################################"
			puts "####################################"
			puts "####################################"
			puts "####Y O U   H A V E   W O N !!!#####"
			puts "####################################"
			puts "####################################"
			puts "You have used #{@movements} movements"
		else
			puts "Bye!! Do you want to play again?"
		end		
	end
end

GameRooms.new(Player.new(3))