require 'pry'
require_relative 'loadboard'
require_relative 'piece'

class ChessBoard
  include LoadBoard
  attr_accessor :board
  def initialize
    ## set up a hash with 64 empty values
    @board = LoadBoard.load_board
    @winner = nil
    @black_moves = generate_moves("black")
    @white_moves = generate_moves("white")
    @b_king = generate_king("black")
    @w_king = generate_king("white")
    @attack_pieces_white = []
    @attack_pieces_black = []
    binding.pry
  end

  def generate_king(color)
    @board.select{|k,v| v.class.ancestors.include?(Piece) && v.color == color && v.class == King }
  end

  def generate_moves(color)
    all_moves = []
    @board.select {|k,v| v.class.ancestors.include?(Piece) && v.color == color }.each do |piece, val|
      all_moves << val.possible_moves(piece, @board)
    end
    all_moves.delete("[]")
    all_moves.flatten.each_slice(2).to_a
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

board = ChessBoard.new

board.to_s

board.move("f2", "f4")
board.move("d2", "d4")
board.move("e2", "e4")
board.to_s
#Queen test
puts board.board["85"].possible_moves("85", board.board)
#Bishop test
puts board.board["86"].possible_moves("86", board.board)
#Pawn test
puts board.board["71"].possible_moves("71", board.board)
#King test
puts board.board["84"].possible_moves("84", board.board)



