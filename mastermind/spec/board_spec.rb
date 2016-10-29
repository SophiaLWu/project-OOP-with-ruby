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
      it "adds a block with a pattern and feedback to the @board_items array" do
        board = Board.new
        pattern = Pattern.new(:red,:orange,:yellow,:green)
        feedback = Feedback.new
        board.add_block(pattern, board)
        expect(board.board_items) == [[[:red,:orange,:yellow,:green],[0,0]]]
      end

    end

  end
end