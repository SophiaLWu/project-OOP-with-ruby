require "spec_helper"

module Mastermind
  describe Board do

    context "#initialize" do
      it "does not raise an error when initialized without arguments" do
        expect { Board.new }.to_not raise_error
      end

      it "creates an empty array stored as guesses" do
        expect(Board.new.guesses).to eq([])
      end

      it "creates an empty array stored as feedback" do
        expect(Board.new.feedback).to eq([])
      end

    end

    context "#addblock" do
      it "adds a pattern to @guesses and adds a pattern to the @feedback" do
        board = Board.new
        pattern = Pattern.new
        pattern.add_color("red")
        pattern.add_color("orange")
        pattern.add_color("yellow")
        pattern.add_color("green")
        feedback = {correct_slot: 0, correct_color: 0}
        board.add_block(pattern, feedback)
        expect(board.guesses[0].colors).to eq([:R,:O,:Y,:G])
        expect(board.feedback[0][:correct_slot]).to eq(0)
        expect(board.feedback[0][:correct_color]).to eq(0)
      end

    end

  end
end