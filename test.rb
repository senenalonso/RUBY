class CommandLineTool
    @@user = "z"
    @@pass = "z"   

  def self.start
    ask_for_username

    if WordValidator.are_equal_words?(@@user, @user)
      ask_for_password
    else
      puts "This username isn't valid"
      ask_for_username
    end

    if WordValidator.are_equal_words?(@@pass, @pass)
      puts "That's correct!!"
      ask_for_text
    else
      puts "This username isn't valid"
      ask_for_password
    end

    puts "Your text has #{WordCounter.count_words(@text)} words"
  end
  
  private
  def self.ask_for_username
    puts "Username?"
    @user = gets.chomp
  end
  
  def self.ask_for_password
    puts "Password?"
    @pass = gets.chomp
  end
  
  def self.ask_for_text
    puts "Write a text!!"
    @text = gets.chomp
  end
  
end

class WordValidator
  def self.are_equal_words?(word, other_word)
    word == other_word ? true : false
  end
end

class WordCounter
  def self.count_words(text)
    text.split(/[^-a-zA-Z]/).size
  end
end

CommandLineTool.start