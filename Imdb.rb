require 'imdb'

class FilmRater
	def self.rate_films
		ratings = {}
		IO.foreach("movies.txt") do |line|
			list_of_movies =Imdb::Search.new(line)
			rating = list_of_movies.movies[0].rating

			ratings[line] = rating

		end
		ratings.each do |key, value|
    puts "#{key}:#{value}"
		end
	end
end

FilmRater.rate_films


