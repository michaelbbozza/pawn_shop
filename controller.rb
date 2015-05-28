require_relative 'view'
require_relative 'chessboard'
require_relative 'piece'
require_relative 'menu'

class Controller
  def initialize
    ControllerView.clear_terminal
    Menu.start
  end

  def self.start_game
    ControllerView.clear_terminal
    @game_board = ChessBoard.new
    ControllerView.print(@game_board.to_s)
    run
  end

  def self.run
    puts 'hi'
  end
end

Controller.new
