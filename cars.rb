class Car
	attr_reader :wheels
	def initialize(engine,wheels)		
		@engine = engine
		@wheels = wheels			
	end
	def make_noise
		print " BRUMMM!!"
		@engine.make_noise
	end
end


class Engine
	def initialize(sound)
		@sound = sound
	end
	def make_noise
		puts @sound
	end	
end

class WheelsCounter
	def self.count_wheels(cars)
		number_of_wheels = cars.reduce(0) do |total, car|
							(total+car.wheels)
		end
		puts number_of_wheel	s
	end
end

class NoiseMaker
	def self.print_noises(cars)
		cars.each { |car| car.make_noise }
	end
end


engine1 = Engine.new("TACATACA")
engine2 = Engine.new("RRRRRRRR")
engine3 = Engine.new("JARJARJA")
engine4 = Engine.new("TORTORTO")

car1 = Car.new(engine1,1)
car2 = Car.new(engine2,2)
car3 = Car.new(engine3,3)
car4 = Car.new(engine4,4)

cars = [car1, car2, car3, car4]

NoiseMaker.print_noises(cars)
WheelsCounter.count_wheels(cars)
