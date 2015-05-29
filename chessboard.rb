require 'pry'
require_relative 'loadboard'
require_relative 'piece'
require_relative 'hashmap'

class ChessBoard
  include LoadBoard
  include HashMap
  attr_accessor :board, :black_moves, :white_moves, :b_king, :w_king
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
    # binding.pry
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
    # binding.pry
  end

  def in_check?(color)
    if color == "white"
      @black_moves.include?(HashMap.to_board(@w_king.keys[0]))
    else
      @white_moves.include?(HashMap.to_board(@b_king.keys[0]))
    end
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


  def set_variables
    @b_king = generate_king("black")
    @w_king = generate_king("white")
    @black_moves = generate_moves("black")
    @white_moves = generate_moves("white")
  end

  def test(board)
    set_variables
    board.to_s
    puts board.in_check?("black")
    puts board.b_king
    puts HashMap.to_board(@b_king.keys[0])
    puts board.white_moves.to_s
  end


end



board = ChessBoard.new
board.to_s

board.move("e2", "e4")
board.test(board)
board.move("a7", "a6")
board.test(board)
board.move("d1", "h5")
board.test(board)
board.move("b8", "a6")
board.test(board)
board.move("f1", "c4")
board.test(board)
board.move("a6", "a5")
board.test(board)
board.move("c4", "f7")
board.test(board)




