require 'csv'
require_relative 'chessboard.rb'
module Parser

  def self.import(file,game_name)
    chess_boards = CSV.read(file,:headers => true,:header_converters => :symbol)
    chess_boards.find { |row| row if row[:save_name] = game_name }
  end




  def self.save(datum)
    CSV.open('chess.csv',"a+") do |csv|
      csv << datum.values
    end
  end
end

p Parser.import('chess.csv','zeta')[:board]

users = {:user_1 => 'Tom', :user_2 => 'Ben'}
time = '2015-05-28 15:46:23 -0400'
name = 'zeta'
board = {}


board_data = {
  :username => users,
  :time => time,
  :board => board,
  :name => name

  }
# Import

# p Parser.import('chess.csv','omega')
# datum = { board_data: { users, time, name } }
Parser.save (board_data)
