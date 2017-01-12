module LinearFigure
	def is_lineal_move?(init,final,limit=0)
		if limit 
			((init[0]==final[0] && (final[1]==init[1]+1 || final[1]==init[1]-1)) || (init[1]==final[1] && (final[1]==init[1]+1 || final[1]==init[1]-1)))
		else
			(init[0]==final[0] || init[1]==final[1])
		end
	end
end

module DiagonalFigure
	def is_diagonal_move?(init,final,limit=0)
		!limit ? steps =init[0] - final[0] : steps = limit
		check_doble_diagonal?(init, final, steps)
	end
	def check_doble_diagonal?(init, final, steps)
		check_diagonal?(init[0], final[0], steps) && check_diagonal?(init[1], final[1], steps) 
	end
	def check_diagonal?(init, final, steps)
		final == init + steps || final == init - steps
	end
end