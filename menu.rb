module Menu

  def self.start
    MenuView.welcome
    play
  end

  def self.play
    input = MenuView.user_input
    if input == 'new'
      Controller.new
    elsif input == 'load'
      puts "hi"
    else
      MenuView.user_fucked_up
    end
  end


end
