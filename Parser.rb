require 'csv'



module Parser

  def self.import(file)
    chess_hash = {}
    chess_board = CSV.read(file,:headers => true,:header_converters => :symbol)
    chess_board.each {|row| chess_hash[row[:position]] = piece(row[:class],row[:color]) }
    chess_hash
  end

  def self.save(datum)
    CSV.open('chess.csv',"wb") do |csv|
      csv << ['position','class','color']
      datum.each do |key,value|
        if value == []
          csv << [key,value]
        else
          csv << [key,value.class,value.color]
        end
      end
    end
  end

  def self.piece(string_class,color)
    return [] if string_class == "[]"
     piece_class = Kernel.const_get string_class
     piece_class.new(color)
  end

end





# @board=
#   {"11"=>%<9a7b0cb8Rook:0x007f80a9c0da60 @character="♖", @color="black">,
#    "12"=>#<Knight:0x007f80a9c0d4c0 @character="♘", @color="black">,
#    "13"=>#<Bishop:0x007f80a9c0d088 @character="♗", @color="black">,
#    "14"=>#<Queen:0x007f80a9c0cc00 @character="♕", @color="black">,
#    "15"=>#<King:0x007f80a9c0cb10 @character="♔", @color="black">,
#    "16"=>#<Bishop:0x007f80a9c0cf98 @character="♗", @color="black">,
#    "17"=>#<Knight:0x007f80a9c0d3f8 @character="♘", @color="black">,
#    "18"=>#<Rook:0x007f80a9c0d948 @character="♖", @color="black">,
#    "21"=>
#     #<Pawn:0x007f80a9c0f158 @character="♙", @color="black", @first_move=false>,
#    "22"=>
#     #<Pawn:0x007f80a9c0eff0 @character="♙", @color="black", @first_move=false>,
#    "23"=>
#     #<Pawn:0x007f80a9c0ef00 @character="♙", @color="black", @first_move=false>,
#    "24"=>
#     #<Pawn:0x007f80a9c0ee10 @character="♙", @color="black", @first_move=false>,
#    "25"=>
#     #<Pawn:0x007f80a9c0ed20 @character="♙", @color="black", @first_move=false>,
#    "26"=>
#     #<Pawn:0x007f80a9c0ebe0 @character="♙", @color="black", @first_move=false>,
#    "27"=>
#     #<Pawn:0x007f80a9c0eaa0 @character="♙", @color="black", @first_move=false>,
#    "28"=>
#     #<Pawn:0x007f80a9c0e8e8 @character="♙", @color="black", @first_move=false>,
#    "31"=>[],
#    "32"=>[],
#    "33"=>[],
#    "34"=>[],
#    "35"=>[],
#    "36"=>[],
#    "37"=>[],
#    "38"=>[],
#    "41"=>[],
#    "42"=>[],
#    "43"=>[],
#    "44"=>[],
#    "45"=>[],
#    "46"=>[],
#    "47"=>[],
#    "48"=>[],
#    "51"=>[],
#    "52"=>[],
#    "53"=>[],
#    "54"=>[],
#    "55"=>[],
#    "56"=>[],
#    "57"=>[],
#    "58"=>[],
#    "61"=>[],
#    "62"=>[],
#    "63"=>[],
#    "64"=>[],
#    "65"=>[],
#    "66"=>[],
#    "67"=>[],
#    "68"=>[],
#    "71"=>
#     #<Pawn:0x007f80a9c0e7f8 @character="♟", @color="white", @first_move=false>,
#    "72"=>
#     #<Pawn:0x007f80a9c0e690 @character="♟", @color="white", @first_move=false>,
#    "73"=>
#     #<Pawn:0x007f80a9c0e2a8 @character="♟", @color="white", @first_move=false>,
#    "74"=>
#     #<Pawn:0x007f80a9c0e140 @character="♟", @color="white", @first_move=false>,
#    "75"=>
#     #<Pawn:0x007f80a9c0e000 @character="♟", @color="white", @first_move=false>,
#    "76"=>
#     #<Pawn:0x007f80a9c0de20 @character="♟", @color="white", @first_move=false>,
#    "77"=>
#     #<Pawn:0x007f80a9c0dc90 @character="♟", @color="white", @first_move=false>,
#    "78"=>
#     #<Pawn:0x007f80a9c0db50 @character="♟", @color="white", @first_move=false>,
#    "81"=>#<Rook:0x007f80a9c0d808 @character="♜", @color="white">,
#    "82"=>#<Knight:0x007f80a9c0d2e0 @character="♞", @color="white">,
#    "83"=>#<Bishop:0x007f80a9c0ce80 @character="♝", @color="white">,
#    "84"=>#<King:0x007f80a9c0c9f8 @character="♚", @color="white">,
#    "85"=>#<Queen:0x007f80a9c0c8e0 @character="♛", @color="white">,
#    "86"=>#<Bishop:0x007f80a9c0cd68 @character="♝", @color="white">,
#    "87"=>#<Knight:0x007f80a9c0d1f0 @character="♞", @color="white">,
#    "88"=>#<Rook:0x007f80a9c0d600 @character="♜", @color="white">}>}
