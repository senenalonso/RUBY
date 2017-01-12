class Board
		MAX_SIZE = 8
	def initialize(file)
		@board = build_board_from_file(file)
	end

	def self.is_valid_box?(box,color)
		!is_out_bounds?(box) && (is_empty_box?(box) || is_opponent?(box,color))
	end

	def self.transform_box_to_coordinate(box)
		coordinates = box.split("")
		transform_box = [8-coordinates[1].to_i,coordinates[0].ord-97]
	end

	def move(init, final)
		#puts "MOVIMIENTO: #{init} -- #{final}"
		type_figure = @board[init[0]][init[1]].to_s.split("")
		color = type_figure[0]
		figure = case type_figure[1]
			when "R" then Rock.new(color)
			when "N" then Knight.new(color)
			when "B" then Bishop.new(color)
			when "Q" then Queen.new(color)
			when "K" then King.new(color)
			when "P" then Pawn.new(color)
		end
		if figure
			figure.move(init,final)
		else
			puts "ILEGAL"	
		end
	end

	private
	def self.is_out_bounds?(box)
		!(box[0].between?(0,MAX_SIZE) && box[1].between?(0,MAX_SIZE) )
	end

	def self.is_empty_box?(box)
		@@board[box[0]][box[1]] == nil
	end

	def self.is_opponent?(box,color)
		@@board[box[0]][box[1]].to_s.split("")[0] != color
	end

	def build_board_from_file(file)
		board =Array.new(MAX_SIZE) { Array.new(MAX_SIZE) }
		line_index=0
		IO.foreach(file) do |line|
			boxes = line.split
			boxes.each_with_index do |box, column_index| 
				if !(box == "--")
					board[line_index][column_index]=box.to_sym 
				end
			end
			line_index += 1
		end
		board
	end
end
