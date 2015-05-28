require_relative 'loadboard'
module HashMap
  def self.to_board(mapped)
    [LETTERS.invert[mapped[1].to_i].to_s, (9 - mapped[0]).to_s]
  end
end
