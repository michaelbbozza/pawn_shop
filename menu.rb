module Menu

  def self.start
    MenuView.welcome
    play
  end

  def self.play
    input = MenuView.user_input
    if input == 'new'
      Controller.start_game
    elsif input == 'load'
      Controller.resume_game
    elsif input == 'exit' || input == 'quit'
      exit
    else
      MenuView.user_messed_up
      play
    end
  end


end
