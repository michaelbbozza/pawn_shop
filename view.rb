require 'artii'

module MenuView
  def self.welcome
    welcome = Artii::Base.new :font => 'sblood'
    #doom, bubble, usaflag, rounded
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
  def self.print(output)
    puts output
  end

  def self.clear_terminal
    system 'clear'
  end
end
