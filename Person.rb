class Person
	attr_reader :name, :age
	attr_writer :age
	def initialize(name,age)
		@name = name
		@age = age
	end	
end

person1 = Person.new("Senén", 38)

person2 = Person.new("Senén Jr.", 7)

puts person1.name
puts person1.age

#person1.name="Yo"
person1.age = 55

puts person1.name
puts person1.age
