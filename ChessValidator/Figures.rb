class Figure
	def initialize(color)
		@color = color				
	end
	def move(init,final)
		if check_move?(init,final)
			puts "LEGAL"
		else 
			puts "ILEGAL"
		end 
	end
	def check_move?(init,final)
		false		
	end
end

class Rock < Figure
	include LinearFigure
	def check_move?(init,final)
		if Board.is_valid_box?(final,@color)
			is_lineal_move?(init,final)
		end
	end		
end

class Bishop < Figure
	include DiagonalFigure
	def check_move?(init,final)
		if Board.is_valid_box?(final,@color)
			is_diagonal_move?(init,final)
		end
	end		
end

class Queen < Figure
	include DiagonalFigure, LinearFigure
	def check_move?(init,final)		
		if Board.is_valid_box?(final,@color)
			(is_diagonal_move?(init,final) || is_lineal_move?(init,final))
		end
	end		
end

class King < Figure
	include DiagonalFigure, LinearFigure
	def check_move?(init,final)
		if Board.is_valid_box?(final,@color)
			(is_diagonal_move?(init,final,1) || is_lineal_move?(init,final,1))
		end
	end		
end

class Knight < Figure
	def check_move?(init,final)
		#puts "I'm a knight"
		if Board.is_valid_box?(final,@color)
			check_l(init,final,1,2) || check_l(init,final,2,1) || check_l(init,final,-1,2) || check_l(init,final,-2,1)
		end
	end
		def check_l(init,final,h,v)
			return (final[0]==init[0] + v && (final[1] == init[1] + h || final[1] == init[1] - h))
		end		
end

class Pawn < Figure
	def check_move?(init,final)
		#puts "I'm a Pawn"
		result = false
		is_white = @color == "w"
		is_white ? initial_position = init[0] == 6 : initial_position = init[0] == 1		
		if Board.is_valid_box?(final,@color)
			if is_white
				result = init[1]==final[1] && (initial_position ? final[0].between?(init[0] - 2, init[0] - 1) : final[0]==init[0] - 1)
			else
				result = init[1]==final[1] && (initial_position ? final[0].between?(init[0] + 1, init[0] + 2) : final[0]==init[0] + 1)
			end
		end
		result
	end		
end
