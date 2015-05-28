require 'artii'

module MenuView
  def self.welcome
    system 'clear'
    welcome = Artii::Base.new :font => 'usaflag'
    puts welcome.asciify("welcome")
        puts welcome.asciify("to")
    puts welcome.asciify("pawn")
    puts welcome.asciify("shop")
    puts welcome.asciify("chess")
    puts "Enter 'new' for new game or 'load' for a saved game"
  end

  def self.user_fucked_up
    puts 'I did not understand what you wanted. Please re-enter your choice:'
    puts "'New' or 'Load'"
  end
  def self.user_input
    gets.chomp.downcase
  end
end

module ControllerView
end
