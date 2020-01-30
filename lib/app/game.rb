class Game
  attr_accessor :players, :board, :finger_right, :finger_left
  def initialize (array_of_names)
    cross_mark = "\u2718".brown
    circle_mark = "\u274D".cyan
    @finger_right = "\u{1f449}  "
    @finger_left = "  \u{1f448}"
    @players = [Player.new(array_of_names[0], cross_mark, "\u{1f466}"	), Player.new(array_of_names[1], circle_mark, "\u{1f469}")]
    welcome_players
    new_round
    select_random_first_player
    perform
    
  end
  # Affiche la représentation graphique de la board
  def render_grid
    Show.new(@board).render_board
  end
  # redéfinit la board par une nouvelle board vierge
  def new_round
    @board = Board.new()
  end
  #Affiche un message de bienvenue et leurs token respectifs.
  def welcome_players
    puts "Hello, players! \u{1f46c}".green
    puts ""
    @players.each do |player|
      puts "#{player.emoji} #{player.name} has the #{player.token} token!".blue
    end
    print @finger_right + "Press Enter to begin ! <".green + @finger_left
    gets.chomp
  end
  #Retourne le joueur étant first player
  def find_current_player
    @players.find {|player| player.is_current_player == true}
  end
  # Echange le statut de current player entre les deux joueurs
  def switch_current_player
    players.each{|player| player.is_current_player = !player.is_current_player}
  end 
  #Retourne le joueur étant first player
  def find_first_player
    @players.find {|player| player.is_first_player == true}
  end
  # Echange le statut de first player entre les deux joueurs
  def switch_first_player
    @players.each{|player| player.is_first_player = !player.is_first_player}
  end
  # choisit un des 2 joueurs au hasard pour commencer la partie
  def select_random_first_player
    puts "Random choice of the first player...".red
    first_player = @players[rand(0..1)]
    first_player.is_current_player = true
    first_player.is_first_player = true
    puts "#{find_first_player.emoji} #{find_first_player.name} will play first!".blue
  end
  #Définit le first player désigné dans une autre fonction comme current player
  def set_first_player_as_current_player
    @players.each{|player|
    if player.is_first_player == true
      player.is_current_player = true
    else
      player.is_current_player = false
    end
    }
  end
  # Affiche au joueur le texte lui proposant de choisir une action, puis retourne la valeur choisie par le joueur
  def player_choice
    puts "      #{find_current_player.emoji} #{find_current_player.name}'s turn !'".blue
    puts ""
    puts " What cell do you choose? (1-9)".magenta
    print @finger_right
    p_choice = gets.chomp.to_i
    p p_choice
    while (p_choice < 1 || p_choice > 9 ) || @board.cells[p_choice-1].state != " "
      if (p_choice < 1 || p_choice > 9 )
        puts "\u{1f928} mmmhh you're not that smart isn't it? You need to enter a digit between 1 and 9..."
        print @finger_right
      elsif @board.cells[p_choice-1].state != " "
        puts "\u{1f644} You can't choose this one as it's already marked, you dumb..."
        print @finger_right
      end
      p_choice = gets.chomp.to_i
    end
    return p_choice
  end
  #assigne le token correspondant au joueur en entrée à la cellule qu'il a choisi en se basant sur son index dans le tableau board
  def perform_choice (player_choice)
    @board.cells[player_choice-1].state = find_current_player.token
    @board.next_turn
  end
  #boucle de jeu, qui continue tant que la board n'est pas full ou que les conditions de victoire ne sont pas réunies
  def game_cycle
    while !@board.is_board_full? && @board.check_victory_cases == nil
      render_grid
      perform_choice(player_choice)
      switch_current_player
    end
  end
  # Annonce que la manche est terminée par une égalité puis propose de rejouer. Renvoie le choix y ou n
  def announce_round_is_draw
    puts " \u{1f610} This round is a draw".blue
    show_score
    puts ""
    puts "Do you want to play again? (y/n)".magenta
    print @finger_right
    choice = gets.chomp
    while choice != "y" && choice != "n" && choice != "Y" && choice != "N"
      puts "\u{1f611} Come'on dont be stupid, you just have to choose yes or no (type y or n then ENTER you dumb!)"
      print @finger_right
      choice = gets.chomp
    end
    choice
  end
  # Annonce le gagnant puis propose de rejouer. Renvoie le choix y ou n
  def annouce_round_winner(winner_player)
    puts "#{winner_player.emoji} #{winner_player.name} has won this round !".blue
    update_score(winner_player)
    puts ""
    show_score
    puts ""
    puts "Do you want to play again? (y \u{1f44d} OR n \u{1f44e})".magenta
    print @finger_right
    choice = gets.chomp
    while choice != "y" && choice != "n" && choice != "Y" && choice != "N"
      puts "\u{1f611} Come'on dont be stupid, you just have to choose yes or no (type y or n then ENTER you dumb!)"
      print @finger_right
      choice = gets.chomp
    end
    choice
  end
  #retourne le joueur correspondant au token
  def return_winner_player(token)
    @players.find { |player| player.token == token}
  end
  #Ajoute un au score du joueur en entrée
  def update_score(winner_player)
    @players.find {|player| player == winner_player}.score += 1
    
  end
  #Affiche les scores de chaque joueur
  def show_score
    @players.each {|player| puts "#{player.name} has #{player.score} points !".blue}
  end

  def wanna_play_again?(choice)
    case choice
    when "y" || "Y"
      switch_first_player
      set_first_player_as_current_player
      perform
    when "n" || "N"
      puts "\u{1f44b}	Bye bye guys !!".green
      exit(true)
    else
      puts "Error: That choice does not exists!"
    end
  end
  #fonction principale de game.rb qui crée une nouvelle board, appelle le game_cycle qui boucle tant que les conditions de fin ne sont pas réunies, puis propose de rejouer ou d'arrêter.
  def perform
    new_round
    game_cycle
    if return_winner_player(@board.check_victory_cases) != nil
      render_grid
      winner = return_winner_player(@board.check_victory_cases)
      wanna_play_again?(annouce_round_winner(winner))
    else
      render_grid
      wanna_play_again?(announce_round_is_draw)
    end
  end
end