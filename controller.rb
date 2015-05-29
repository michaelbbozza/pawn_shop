require_relative 'view'
require_relative 'chessboard'
require_relative 'piece'
require_relative 'menu'
require_relative 'Parser'
require_relative 'hashmap'
require 'pry'

class Controller
  attr_reader :game_board
  def initialize
    ControllerView.clear_terminal
    Menu.start
  end

  def self.start_game
    ControllerView.clear_terminal
    @game_board = ChessBoard.new
    ControllerView.print(@game_board.to_s)
    input = ControllerView.begin
    if input == 'yes'
      sleep 0.5
      run_new_game
    elsif input != 'no'
      input = ControllerView.reenter_option
      if input == 'yes'
        run_new_game
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
    @game_board = ChessBoard.new
    @parsed_board =  Parser.import('chess.csv')
    @game_board.board = @parsed_board
    ControllerView.print(@game_board.to_s)
    ControllerView.turn
    ControllerView.rotate_player
    run_new_game
  end

  def self.run_new_game
    20.times do
      source = ControllerView.get_user_piece
      board_index = @game_board.number_converter(source)
      # binding.pry
      piece_possible_moves = @game_board.board[board_index].possible_moves(board_index,@game_board.board)
      ControllerView.give_possible_moves(piece_possible_moves)
      target = ControllerView.get_user_target
      # if @game_board.board[board_index].possible_moves(target.split(""), @game_board.board)
      #   true
      # else
      #   ControllerView.invalid_move
      #   run_new_game
      # end
      sleep 0.4
      @game_board.move(source,target)
      @game_board.set_variables
      @game_board.in_check?(player) # may need to be changed
      ControllerView.clear_terminal
      ControllerView.print(@game_board.to_s)
      ControllerView.turn
      Parser.save(@game_board.board)
    end
    ControllerView.continue
    input = ControllerView.user_input
    if input == 'yes'
      run_new_game
    elsif input == 'save'
      Parser.save(@game_board.board)
    elsif input == 'no' ||input == 'exit' || input == 'quit'
      ControllerView.clear_terminal
      ControllerView.goodbye
    end
  end
end

Controller.new
