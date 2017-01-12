require_relative '../EmailSubjectSearcher'
require_relative './EmailProviderMock'
require 'spec_helper'

describe EmailSubjectSearcher do 

	before :each do
		@searcher = EmailSubjectSearcher.new
	end

  let (:email) {"senenalonso@gmail.com"}

  let (:email_provider) {EmailProviderMock.new}

  describe "#word_searcher_in_subjects?" do
    it "Test 1: If no word alwways return false" do
      expect(@searcher.word_searcher_in_subjects?("",email,email_provider)).to eq(false)
    end
    it "Test 2: If a word doesn't exist return false" do
      expect(@searcher.word_searcher_in_subjects?("Pepe",email,email_provider)).to eq(false)
    end
    it "Test 3: If a word exists return true" do
      expect(@searcher.word_searcher_in_subjects?("text1",email,email_provider)).to eq(true)
    end
  end
  
end