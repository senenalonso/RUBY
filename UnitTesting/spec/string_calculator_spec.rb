require_relative '../StringCalculator'
require 'spec_helper'

describe "StringCalculator" do
	it "returns 0 for a empty string" do
		expect(StringCalculator.new.add("")).to eq(0)
	end

	it "returns 1 just for that number" do
		expect(StringCalculator.new.add("1")).to eq(1)
	end

	it "returns 2 for '1,1'" do
		expect(StringCalculator.new.add("1,1")).to eq(2)
	end

	it "returns 3 for '1,1,1'" do
		expect(StringCalculator.new.add("1,1,1")).to eq(3)
	end

	it "returns 3 for '1;1;1'" do
		expect(StringCalculator.new.add("1;1;1")).to eq(3)
	end

	it "returns 3 for '1\n1\n1'" do
		expect(StringCalculator.new.add("1\n1\n1")).to eq(3)
	end
end