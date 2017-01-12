require_relative '../FizzBuzz'
require 'spec_helper'

describe "FizzBuzz for one number" do

	before :each do
		@fb = FizzBuzz.new
	end

	it "returns 1 for 1" do
		expect(@fb.execute(1)).to eq(1)
	end

	it "returns 'Fizz' for multiplo 3" do
		expect(@fb.execute(3)).to eq("Fizz")
	end

	it "returns 'Buzz' for multiplo 5" do
		expect(@fb.execute(5)).to eq("Buzz")
	end
	it "returns 'FizzBuzz' for multiplo 15" do
		expect(@fb.execute(15)).to eq("FizzBuzz")
	end



describe "FizzBuzz for an Array" do

	before :each do
		@fb = FizzBuzz.new
	end

	it "returns 1 for [1]" do
		expect(@fb.execute(1)).to eq(1)
	end

	it "returns 'Fizz' for [multiplo 3]" do
		expect(@fb.execute(3)).to eq("Fizz")
	end

	it "returns 'Buzz' for [multiplo 5]" do
		expect(@fb.execute(5)).to eq("Buzz")
	end
	it "returns 'FizzBuzz' for [multiplo 15]" do
		expect(@fb.execute(15)).to eq("FizzBuzz")
	end
end
