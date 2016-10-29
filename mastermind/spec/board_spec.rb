require "spec_helper"

module Mastermind
  describe Board do

    context "#initialize" do
      it "does not raise an error when initialized without arguments" do
        expect { Board.new }.to_not raise_error
      end

      it "creates an empty array stored as @board_items" do
        expect(Board.new.board_items) == []
      end

    end

    context "#addblock" do
      it "adds a block with a pattern and clues to the @board_items array" do
        board = Board.new
        pattern = Pattern.new
        pattern.add_color("red")
        pattern.add_color("orange")
        pattern.add_color("yellow")
        pattern.add_color("green")
        comp = Computer.new
        board.add_block(pattern, board)
        expect(board.board_items) == [[[:R,:O,:Y,:G],[0,0]]]
      end

    end

  end
end