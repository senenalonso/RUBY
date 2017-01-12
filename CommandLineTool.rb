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
      #ask_for_text
      start_menu
    else
      puts "This username isn't valid"
      ask_for_password
    end
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

  def self.start_menu
    ask_for_text
    print_menu
    option = gets.chomp
    execute_option(option, @text)
  end
  
  def self.print_menu
    puts "Select an option:"
    puts "  1) Count words"
    puts "  2) Count leters"
    puts "  3) Reverse the text"
    puts "  4) To uppercase"
    puts "  5) To lowercase"    
  end

  def self.execute_option(option, text)

    result = case option
      when "1" then WordCounter.count_words(text)
      when "2" then LetterCounter.count_letters(text)
      when "3" then TextReverser.reverse_text(text)
      when "4" then TextCaser.modify_text(0,text)
      when "5" then TextCaser.modify_text(1,text)
      else "Invalid option"
    end

    puts "The result is: #{result}"
  end
  
end

class WordValidator
  def self.are_equal_words?(word, other_word)
    word == other_word
  end
end

class WordCounter
  def self.count_words(text)
    text.split(/[^-a-zA-Z]/).size
  end
end

class LetterCounter
  def self.count_letters(text)
    count = 0    
    text.each_char do |char| 
        next unless char =~/\w/
        count += 1
    end
    count
  end
end

class TextReverser
  def self.reverse_text(text)
    text.reverse!
  end
end

class TextCaser
  def self.modify_text(option, text)
    result = case option
      when 0 then text.upcase!
      when 1 then text.downcase!
    end
  end
end

CommandLineTool.start