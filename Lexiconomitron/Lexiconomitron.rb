require 'pry'

class Lexiconomitron

	def eat_t(text)
		text.gsub(/([t|T])/, '')		
	end	

	def shazam(array_words)
		result = array_words.map { |word| eat_t(word.reverse) }
		case result.length
			when 0 then []
			when 1 then [result[0]]
			else [result[0],result[result.length-1]]
		end
	end

	def oompa_loompa(array_words)		
		result = array_words.map { |word| (eat_t(word).length <= 3) ? eat_t(word) : nil}
		result.compact
	end

end