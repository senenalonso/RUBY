class Grid
	SIZE = 8
	def initialize(file)
		@grid = build_grid_from_file(file)		
	end	

	def execute_turn
		@grid.each_with_index do |line, line_index|
			line.each_with_index do |cell, column_index|
				neighbours = calculate_neighbours(line_index,column_index)
				Cell.regenerate(cell, neighbours)
			end
		end
	end

	private
	def build_grid_from_file(file)
		grid =Array.new(SIZE) { Array.new(SIZE) }
		line_index=0
		IO.foreach(file) do |line|
			boxes = line.split
			boxes.each_with_index do |box, column_index| 
					grid[line_index][column_index]=box
				end
			line_index += 1
			end
		grid
	end

	def calculate_neighbours(line_index,column_index)
		neighbours = []
		
	end
end