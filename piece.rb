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
end

class Rook < Piece
end

class Knight < Piece
end

class Queen < Piece
end

class King < Piece
end
