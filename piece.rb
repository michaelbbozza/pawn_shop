class Piece
  def initialize(color)
    @color = color
  end
end

class Pawn < Piece
  def initialize(color)
    @color = color
    @first_move = false
  end
end

class Bishop < Piece
  def initialize(color)
    @color = color
    if @color == "white"
        ## TODO
    else
      ## TODO
    end
  end

end

class Rook < Piece
  def initialize(color)
    @color = color
    if @color == "white"
        ## TODO
    else
      ## TODO
    end
  end

end

class Knight < Piece
  def initialize(color)
    @color = color
    if @color == "white"
        ## TODO
    else
      ## TODO
    end
  end

end

class Queen < Piece
  def initialize(color)
    @color = color
    if @color == "white"
        ## TODO
    else
      ## TODO
    end
  end

end

class King < Piece
    def initialize(color)
      @color = color
      if @color == "white"
          ## TODO
      else
        ## TODO
      end
    end

end

puts "8 ║♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜"
puts "♙ ♙ ♙ ♙ ♙ ♙ ♙ ♙"
puts "♖ … ♗ ♕ ♔ ♗ ♘ ♖"
puts "♟ ♟ ♟ ♟ ♟ ♟ ♟ ♟"
