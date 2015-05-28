require 'pry'
require_relative 'loadboard'
require_relative 'piece'

LETTERS = {
  "a" => 1,
  "b" => 2,
  "c" => 3,
  "d" => 4,
  "e" => 5,
  "f" => 6,
  "g" => 7,
  "h" => 8
}

class ChessBoard
  attr_accessor :board
  def initialize
    @board = {}
    (1..8).each do |x|
      (1..8).each do |y|
        @board["#{x.to_s}#{y.to_s}"] = []
      end
    end
    (21..28).each {|int| @board[int.to_s] = Pawn.new("black")}
    (71..78).each {|int| @board[int.to_s] = Pawn.new("white")}
    [11, 18].each {|int| @board[int.to_s] = Rook.new("black")}
    [81,88].each {|int| @board[int.to_s] = Rook.new("white")}
    [12, 17].each {|int| @board[int.to_s] = Knight.new("black")}
    [82, 87].each {|int| @board[int.to_s] = Knight.new("white")}
    [13, 16].each {|int| @board[int.to_s] = Bishop.new("black")}
    [83, 86].each {|int| @board[int.to_s] = Bishop.new("white")}
    @board[14.to_s] = Queen.new("black")
    @board[15.to_s] = King.new("black")
    @board[84.to_s] = King.new("white")
    @board[85.to_s] = Queen.new("white")
  end

  def to_s
    @board.map {|k,v| v != [] ? v.character : " "}.each_slice(8).to_a.each_with_index do |arr, index|
      puts ("#{8 - index }| ") + arr.join(" | ") + "\n  _______________________________|\n"
    end
    puts                       "    a   b   c   d   e   f   g   h "
  end

  def number_converter(string)
    string = string.split("")
    (9 - string.last.to_i).to_s + LETTERS[string.first].to_s
  end

  def location_converter(start)
    piece = number_converter(start)
    return @board[piece]
  end

  def move(source,target)
    source = number_converter(source)
    target = number_converter(target)
    @board[target] = @board[source]
    @board[source] = []
  end


end

board = ChessBoard.new

board.to_s
board.move("d2", "d3")
board.to_s

