require_relative 'loadboard'
require_relative 'hashmap'

class Piece
  attr_reader :character, :color

  def initialize(color)
    @color = color
  end
end

class Pawn < Piece
  attr_reader :character, :color
  def initialize(color)
    @color = color
    @first_move = false
    if @color == "white"
      @character = "♟"
    else
      @character = "♙"
    end
  end
end

class Bishop < Piece
  attr_reader :character, :color
  def initialize(color)
    @color = color
    if @color == "white"
      @character = "♝"
    else
      @character = "♗"
    end
  end

end

class Rook < Piece
  attr_reader :character, :color
  def initialize(color)
    @color = color
    if @color == "white"
      @character = "♜"
    else
      @character = "♖"
    end
  end

end

class Knight < Piece
  attr_reader :character, :color
  def initialize(color)
    @color = color
    if @color == "white"
      @character = "♞"
    else
      @character = "♘"
    end
  end

  def possible_moves(location, board)
    poss_moves = []
    KNIGHT_DIRECTIONS.each do | xy |
      poss_moves << [(location.split("")[0].to_i + xy[0]), (location.split("")[1].to_i + xy[1])]
    end
    poss_moves.delete_if{|arr| !arr.all? {|x| x > 0 && x <= 8 }}

    poss_moves.each_with_index do |move, index|
      if board[move.join].class.ancestors.include?(Piece)

      end
    end

    poss_moves.map! do |move|
      HashMap.to_board(move)
    end
    poss_moves.to_s
  end
end

class Queen < Piece
  attr_reader :character, :color
  def initialize(color)
    @color = color
    if @color == "white"
      @character = "♛"
    else
      @character = "♕"
    end
  end

end

class King < Piece
  attr_reader :character, :color
  def initialize(color)
    @color = color
    if @color == "white"
      @character = "♚"
    else
      @character = "♔"
    end
  end
end

