require "spec_helper"

module Mastermind
  describe Feedback do

    context "#initialize" do
      it "does not raise an error when initialized without arguments" do
        expect { Feedback.new }.to_not raise_error
      end
    end

    context "#clues" do
      it "returns an object that maps clue type (black or white) to a number" do
        feedback = Feedback.new
        expect(feedback.clues) == {black: 0, white: 0}
      end

      it "allows the changing of the clues objects' values" do
        feedback = Feedback.new
        feedback.clues[:black] += 2
        feedback.clues[:white] += 1
        expect(feedback.clues) == {black: 2, white: 1}
      end
    end

  end
end