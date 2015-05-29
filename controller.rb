require_relative 'view'
require_relative 'chessboard'
require_relative 'piece'
require_relative 'menu'
require_relative 'Parser'
require 'pry'

class Controller
  def initialize
    ControllerView.clear_terminal
    # @game_board = ChessBoard.new
    Menu.start
    # binding.pry
  end

  def self.start_game
    ControllerView.clear_terminal
    @game_board = ChessBoard.new
    ControllerView.print(@game_board.to_s)
    input = ControllerView.begin
    if input == 'yes'
      sleep 0.5
      run
    elsif input != 'no'
      input = ControllerView.reenter_option
      if input == 'yes'
        run
      elsif input == 'no'
        ControllerView.goodbye
      end
    elsif input == 'no'
      ControllerView.clear_terminal
      ControllerView.goodbye
      exit
    end
  end

  def self.resume_game
  #   # @old_board = @game_board.dup
  #   Parser.import('chess.csv')
  #   ControllerView.print(@old_board.to_s)
  end

  def self.run
    2.times do
      source = ControllerView.get_user_piece
      target = ControllerView.get_user_target
      sleep 0.4
      @game_board.move(source,target)
      ControllerView.clear_terminal
      ControllerView.print(@game_board.to_s)
      ControllerView.turn
    end
    ControllerView.continue
    input = ControllerView.user_input
    if input == 'yes'
      run
    elsif input == 'save'
      Parser.save(@game_board.board)
    elsif input == 'no' ||input == 'exit' || input == 'quit'
      ControllerView.clear_terminal
      ControllerView.goodbye
    end
  end
end

Controller.new
