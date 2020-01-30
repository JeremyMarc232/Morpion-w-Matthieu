class Cell
  attr_accessor :number, :state
  # Notons ici que le state correspond au token des joueurs ou alors à une string contenant un seul espace quand elle est vide
  def initialize (number)
    @number = number
    @state = " "
  end
end