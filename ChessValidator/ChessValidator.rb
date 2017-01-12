require_relative 'Board'
require_relative 'ChessModules'
require_relative 'Figures'


board = Board.new("complex_board.txt")

IO.foreach("complex_moves.txt") do |line|
	boxes = line.split
	init = Board.transform_box_to_coordinate(boxes[0])
	final = Board.transform_box_to_coordinate(boxes[1])
	board.move(init, final)
end
