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

# puts "8 ║♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜"
# puts "♙ ♙ ♙ ♙ ♙ ♙ ♙ ♙"
# puts "♖ … ♗ ♕ ♔ ♗ ♘ ♖"
# puts "♟ ♟ ♟ ♟ ♟ ♟ ♟ ♟"
