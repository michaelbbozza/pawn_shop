require_relative 'view'
require_relative 'chessboard'
require_relative 'piece'
require_relative 'menu'

class Controller
  def initialize
    # @game_board = Board.new
    run
  end

  def run
    Menu.start
  end
end

Controller.new
