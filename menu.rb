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
      puts "NO"
    else
      MenuView.user_fucked_up
      play
    end
  end


end
