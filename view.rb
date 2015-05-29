require 'artii'


module MenuView
  def self.welcome
    welcome = Artii::Base.new :font => 'rounded'
    puts welcome.asciify("welcome")
    puts welcome.asciify("to")
    puts welcome.asciify("pawn")
    puts welcome.asciify("shop")
    puts welcome.asciify("chess")
    puts "Enter 'new' for new game or 'load' for a saved game"
  end

  def self.user_messed_up
    puts 'I did not understand what you wanted. Please re-enter your choice:'
    puts "'New' or 'Load'"
  end

  def self.user_input
    gets.chomp.downcase
  end
end

PLAYER = ["White", "Black"]

module ControllerView
  def self.print(output)
    puts output
  end

  def self.clear_terminal
    system 'clear'
  end

  def self.get_user_piece
    puts "What piece would you like to move?"
    gets.chomp.downcase
  end

  def self.give_possible_moves(output)
    puts "Here are your possible moves: "
    puts output
  end

  def self.get_user_target
    puts "Where would you like to move?"
    gets.chomp.downcase
  end

  def self.begin
    puts "Would you like to start? White moves first."
    gets.chomp.downcase
  end

  def self.rotate_player
    PLAYER.rotate!
  end

  def self.turn
    puts "#{PLAYER.first} may go."
  end

  def self.continue
    puts "Would you like to continue?"
    puts "If not, you may 'save' or 'exit'."
  end

  def self.save
    puts "Would you like to save or exit?"
    gets.chomp.downcase
  end

  def self.goodbye
    puts "Goodbye"
  end

  def self.user_input
    gets.chomp.downcase
  end

  def self.reenter_option
    puts "I'm sorry. Please enter 'yes' or 'no'."
    gets.chomp.downcase
  end

end
