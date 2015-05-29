require 'pry'
require_relative 'loadboard'
require_relative 'piece'
require_relative 'Parser.rb'

class ChessBoard
  include LoadBoard
  attr_accessor :board
  def initialize
    ## set up a hash with 64 empty values
    @board = LoadBoard.load_board
  end

  def to_s ## prints the board to the screen
    @board.map {|k,v| v != [] ? v.character : " "}.each_slice(8).to_a.each_with_index do |arr, index|
      puts ("#{8 - index }| ") + arr.join(" | ") + "\n  _______________________________|\n"
    end
    puts                       "    a   b   c   d   e   f   g   h "
  end

  def number_converter(string) ## finds the hash key index given a user input
    string = string.split("")
    (9 - string.last.to_i).to_s + LETTERS[string.first].to_s
  end

  def move(source,target) ## moves pieces given a starting an ending position
    source = number_converter(source)
    target = number_converter(target)
    @board[target] = @board[source]
    @board[source] = []
  end

end


module Parser

  def self.import(file,game_name)
    chess_positions = CSV.read(file,:headers => true,:header_converters => :symbol)
  end

  def self.save(datum)
    CSV.open('chess.csv',"a+") do |csv|
      datum.each do |key,value|
        csv << [key,value]
      end
    end
  end

end

board = ChessBoard.new

# p board

# board.to_s
# board.move("e2", "e5")
# board.to_s

Parser.save(board.board)

