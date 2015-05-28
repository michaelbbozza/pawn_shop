require 'pry'
require_relative 'piece'

class ChessBoard
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
    line_width = 1000
    @board.map {|k,v| v != [] ? v.character : " "}.each_slice(8).to_a.each_with_index do |arr, index|
      puts ("#{index}| ") + arr.join(" | ") + "\n  _______________________________|\n"
    end
    puts                       "    a   b   c   d   e   f   g   h "
  end

end

board = ChessBoard.new

board.to_s
