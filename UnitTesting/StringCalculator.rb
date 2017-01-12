class StringCalculator
	def add(numbers)
		numbers.split(/(,|;|\n)/).reduce(0) {|sum, n| sum + n.to_i}
	end
end