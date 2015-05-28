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
    ## collect all directional moves of the knight
    KNIGHT_DIRECTIONS.each do | xy |
      poss_moves << [(location.split("")[0].to_i + xy[0]), (location.split("")[1].to_i + xy[1])]
    end
    ## delete the position if it is not contained in the board
    poss_moves.delete_if{|arr| !arr.all? {|x| x > 0 && x <= 8 }}
    ## delete the position if it contains a piece of the same color
    poss_moves.each_with_index do |move, index|
      if board[move.join].class.ancestors.include?(Piece)
        if board[move.join].color == @color
          poss_moves.delete_at(index)
        end
      end
    end
    ## convert the indices to user readable format
    poss_moves.map! {|move| HashMap.to_board(move) }
    poss_moves.to_s
  end
end

class Queen < Piece
  attr_reader :character, :color
  def initialize(color)
    @color = color
    if @color == "black"
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

  def possible_moves(location, board)
    poss_moves = []
    ## collect all directional moves of the knight
    KING_DIRECTIONS.each do | xy |
      poss_moves << [(location.split("")[0].to_i + xy[0]), (location.split("")[1].to_i + xy[1])]
    end
    ## delete the position if it is not contained in the board
    poss_moves.delete_if{|arr| !arr.all? {|x| x > 0 && x <= 8 }}
    ## delete the position if it contains a piece of the same color
    temp_array = []
    poss_moves.each do |move|
      if board[move.join].class.ancestors.include?(Piece)
         temp_array << move unless board[move.join].color == @color
      else
        temp_array << move
      end
    end
    ## convert the indices to user readable format
    poss_moves = temp_array.map! {|move| HashMap.to_board(move) }
    poss_moves.to_s
  end
end

