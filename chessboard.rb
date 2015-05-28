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
    @board
  end
end

board = ChessBoard.new

p board
