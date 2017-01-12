class FizzBuzz


	def execute(num)

		if (num%15==0)
			"FizzBuzz"
		elsif (num%5==0)
			"Buzz"
		elsif (num%3==0)
			"Fizz"
		else
			num
		end

	end

	def print_result
		puts execute(num)
	end



end