module Mastermind

  # Represents the mastermind board, consisting of all of the patterns guessed
  class Board
    attr_accessor :board_items

    def initialize
      @board_items = []
    end

    # Takes in a pattern object and a feedback object and adds it to the
    # board_items array
    def add_block(pattern, feedback)
      @board_items << [pattern, feedback]
    end

    # Returns a formatted board as a string that contains 
    # all of the items from board_items
    def formatted_board
      board_as_text = "Current Guesses and Feedback History:\n"
      board_as_text << " " * 46 << "\# Correct   \# Correct\n"
      board_as_text << "Guess \#   Slot 1   Slot 2   Slot 3   Slot 4      "\
                       "Slot        Color\n"
      board_as_text << "-" * 67 << "\n"
      @board_items.each_with_index do |block, i|
        if i < 9
          board_as_text << "   #{i + 1}   "
        else
          board_as_text << "   #{i + 1}  "
        end
        block[0].colors.each do |color| 
          board_as_text << "      #{color.to_s[0]}  " 
        end
        block[1].each { |clue, num| board_as_text << "        #{num}   " }
        board_as_text << "\n"
      end
      board_as_text << " \n"
      board_as_text
    end

  end

end