class Board
  attr_accessor :cells, :current_turn, :victory_cases
  def initialize
    @cells = Array.new(9) { |index| Cell.new(index+1) }
    @current_turn = 0
    # les différentes conditions de vistoire possible, par number de cell
    @victory_cases = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [3, 5, 7], [1, 5, 9]]
  end

  def next_turn
    @current_turn += 1
  end

  def is_board_full?
    @current_turn >= 9 ? true : false
  end
  # 1/ Récupère les cases correspondant au victory_case à analyser
  # 2/ Vérifie si leur state est le même tout en n'étant pas vide
  # 3/ Retourne le token victorieux ou false
  def check_victory_case (victory_case)
   v_case = @cells.select {|cell| cell.number == victory_case[0] || cell.number == victory_case[1] || cell.number == victory_case[2]}
    v_case.all? {|element| element.state == v_case[0].state && v_case[0].state != " "} ? v_case[0].state : false
  end
  # Vérifie toutes les conditions de victoire possibles et renvoie le token victorieux avec lequel on pourra déterminer le joueur avec la fonction return_winner_player(token) de game.rb
  def check_victory_cases
    @victory_cases.each {|victory_case|
      if check_victory_case(victory_case) != false
        return check_victory_case(victory_case)
      end
        next
      }
      return nil
  end
end