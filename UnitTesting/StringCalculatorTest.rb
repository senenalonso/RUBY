require_relative 'StringCalculator'

calculator = StringCalculator.new

puts 'Empty'
puts calculator.add("")==0? "OK" : "KO"
puts 'Add "2"'
puts calculator.add("2")==2? "OK" : "KO"
puts 'Add "1,1"'
puts calculator.add("1,1")==2? "OK" : "KO"
puts 'Add "1,1,1"'
puts calculator.add("1,1,1")==3? "OK" : "KO"