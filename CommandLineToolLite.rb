class CommandLineTool
  @@string_options = [
    :count_words,
    :count_letters,
    :string_to_uppercase,
    :string_to_lowercase,
    :reverse_string
  ]
  def self.ask_user
    gets.chomp
  end
  def self.present_menu
    puts "Choose an option:"
    puts "1. Count words"
    puts "2. Count letters"
    puts "3. String to uppercase"
    puts "4. String to lowercase"
    puts "5. Reverse string"
  end
  def self.start
    username = ask_user
    password = ask_user
    user_validated = UserValidator.validate_user? username, password
    if user_validated
      puts "User validated"
      chain = ask_user
      present_menu
      option = ask_user
      puts StringOperator.send(@@string_options[option.to_i-1], chain)
    end
  end
end
class StringOperator
  def self.count_words string
    string.split(" ").count
  end
  def self.count_letters string
    string.gsub(/[\s_\W\d]/, "").count
  end
  def self.reverse_string string
    string.reverse
  end
  def self.string_to_uppercase string
    string.uppercase
  end
  def self.string_to_lowercase string
    string.lowercase
  end
end
class UserValidator
  @@username = "Ironhack"
  @@password = "123456"
  def self.validate_user? name, pass
    @@username == name && @@password == pass
  end
end
CommandLineTool.start