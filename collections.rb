class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

=begin
homes = [
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

homes.each do |hm|
  puts "\n#{hm.name} place in #{hm.city}"
  puts "$#{hm.price} a night"
end


prices =  homes.map do |hm|
            hm.price
          end

total = 0.0
prices.each {|price| total+=price}

puts "\nThe average price is : #{total/prices.size}"

prices = homes.reduce(0.0) do |total, hm|
	(total+(hm.price/homes.size.to_f))
end

puts "\nThe average price is : #{prices}"
=end

homes = [
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Nizar's place", "Seville", 2, 42),
  Home.new("Josh's place", "Madrid", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "Cuenca", 4, 49),
  Home.new("Nen's place", "Madrid", 50, 470),
  Home.new("Peter's place", "Madrid", 20, 420),
  Home.new("Jone's place", "Cuenca", 30, 410),
  Home.new("Jane's place", "Madrid", 20, 450),
  Home.new("Robert's place", "Cuenca", 40, 490)
]

puts "Which field do you want to order by? [price|capacity]"
field = gets.chomp
puts "How do you want to order? [top|down]"
order = gets.chomp
puts "Do you want to filter by a city? If not, push Enter"
cities = homes.map {|hm| hm.city}
puts cities.uniq
filter_city = gets.chomp


sorted_homes = homes.sort do |home1, home2|
  # Compare the two homes
  if order == "down"
  	home1.send(field.to_sym) <=> home2.send(field.to_sym)
  else 
  	home2.send(field.to_sym) <=> home1.send(field.to_sym)
  end
end

if filter_city != ""
filtered_sorted_homes=sorted_homes.select {|hm| hm.city == filter_city}
else
	filtered_sorted_homes=sorted_homes
end


puts "\nThe homes according wiht the filters and ordered are:"
filtered_sorted_homes.each {|a| puts a.name}

prices = homes.reduce(0.0) do |total, hm|
	(total+(hm.price/homes.size.to_f))
end

puts "\nThe average price of these homes is: #{prices}"

puts "\nDo you want a especific price?"
user_price = gets.chomp.to_i

filter_price_home = homes.find{|hm| hm.price==user_price}

if filter_price_home
	puts "Your home is: #{filter_price_home.name}"
else
	puts "There isn't any home with this price"
end


