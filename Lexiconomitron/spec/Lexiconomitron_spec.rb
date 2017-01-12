require_relative '../Lexiconomitron'
require 'spec_helper'

describe Lexiconomitron do 

	before :each do
		@lexi = Lexiconomitron.new
	end

  describe "#eat_t" do
    it "T1 : removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
    it "T2 : removes every letter t from the input" do
      expect(@lexi.eat_t("TTTttt")).to eq("")
    end
    it "T3 : removes every letter t from the input" do
      expect(@lexi.eat_t("aeiou")).to eq("aeiou")
    end
    it "T4 : removes every letter t from the input" do
      expect(@lexi.eat_t("")).to eq("")
    end
  end

  describe "#shazam" do
    it "T1 : reverses the letters within the wordsand ends up returning only the first and last words" do
      expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
    end
    it "T2 : reverses the letters within the wordsand ends up returning only the first and last words" do
      expect(@lexi.shazam(["Another", "boring", "test"])).to eq(["rehonA", "se"])
    end
    it "T3 : reverses the letters within the wordsand ends up returning only the first and last words" do
      expect(@lexi.shazam([""])).to eq([""])
    end
    it "T4 : reverses the letters within the wordsand ends up returning only the first and last words" do
      expect(@lexi.shazam([])).to eq([])
    end
  end

  describe "#oompa_loompa" do
    it "T1 : reverses the letters within the wordsand ends up returning only the first and last words" do
      expect(@lexi.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])).to eq(["if", "you", "be", "my"])
    end
    it "T2 : reverses the letters within the wordsand ends up returning only the first and last words" do
      expect(@lexi.oompa_loompa(["3TTTT", "house", "is", "the", "biggest"])).to eq(["3","is", "he"])
    end
  end
end