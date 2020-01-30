class Show
  attr_accessor :board, :cross_token, :circle_token, :vertical_bar, :horizontal_bar, :space
  def initialize(board)
    @board = board
    @cross_token = "\u2718"
    @circle_token = "\u274D"
    @vertical_bar = "\u2502"
    @horizontal_bar = "\u2500"
    @space = " "
  end

  def render_board
    print (@horizontal_bar * 11) * 3 + "\n"
    print (@vertical_bar + space * 4 + @board.cells[0].number.to_s + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[1].number.to_s + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[2].number.to_s + space * 4 + @vertical_bar) + "\n"
    print (@vertical_bar + space * 9 +  @vertical_bar) * 3 + "\n"
    print (@vertical_bar + space * 4 + @board.cells[0].state + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[1].state + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[2].state + space * 4 + @vertical_bar) + "\n"
    print (@vertical_bar + space * 9 +  @vertical_bar) * 3 + "\n"
    print (@horizontal_bar * 11) * 3 + "\n"

    print (@vertical_bar + space * 4 + @board.cells[3].number.to_s + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[4].number.to_s + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[5].number.to_s + space * 4 + @vertical_bar) + "\n"
    print (@vertical_bar + space * 9 +  @vertical_bar) * 3 + "\n"
    print (@vertical_bar + space * 4 + @board.cells[3].state + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[4].state + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[5].state + space * 4 + @vertical_bar) + "\n"
    print (@vertical_bar + space * 9 +  @vertical_bar) * 3 + "\n"
    print (@horizontal_bar * 11) * 3 + "\n"

    print (@vertical_bar + space * 4 + @board.cells[6].number.to_s + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[7].number.to_s + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[8].number.to_s + space * 4 + @vertical_bar) + "\n"
    print (@vertical_bar + space * 9 +  @vertical_bar) * 3 + "\n"
    print (@vertical_bar + space * 4 + @board.cells[6].state + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[7].state + space * 4 + @vertical_bar) + (@vertical_bar + space * 4 + @board.cells[8].state + space * 4 + @vertical_bar) + "\n"
    print (@vertical_bar + space * 9 +  @vertical_bar) * 3 + "\n"
    print (@horizontal_bar * 11) * 3 + "\n"
  end
end