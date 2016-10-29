require "spec_helper"

module Mastermind
  describe Feedback do

    context "#initialize" do
      it "does not raise an error when initialized without arguments" do
        expect { Feedback.new }.to_not raise_error
      end
    end

    context "#clues" do
      it "returns an object that maps clue type "\
         "(correct or correct_color) to a number" do
        feedback = Feedback.new
        expect(feedback.clues) == {correct: 0, correct_color: 0}
      end

      it "allows the changing of the clues objects' values" do
        feedback = Feedback.new
        feedback.clues[:correct] += 2
        feedback.clues[:correct_color] += 1
        expect(feedback.clues) == {correct: 2, correct_color: 1}
      end
    end

  end
end