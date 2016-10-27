module TicTacToe

  # Represents the game board which consists of nine cells
  class Board
    attr_accessor :board # temporarily here for testing purposes

    def initialize
      @cells = Array.new(3, Array.new(3, Cell.new))
      @board = create_board
    end

    def create_board
      board = ""
      horizontal_border = "---+---+---"

      @cells.each_with_index do |row, col|
        row.each_with_index do |cell, i|
          unless i == 0
            board << "|"
          end
          board << " #{cell.state} "
        end
        unless col == 2
          board << "\n#{horizontal_border}\n"
        end
      end

      board
    end

  end

end