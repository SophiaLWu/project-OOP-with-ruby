require "spec_helper"

module Mastermind
  describe Computer do

    context "#initialize" do
      it "does not raise an error when initialized without arguments" do
        expect { Computer.new }.to_not raise_error
      end
    end

    context "#give_feedback" do
      it "returns correct clues when the guess is identical "\
         "to the secret code" do
        c = Computer.new
        code = Pattern.new
        code.add_color("green")
        code.add_color("blue")
        code.add_color("red")
        code.add_color("purple")
        guess = Pattern.new
        guess.add_color("green")
        guess.add_color("blue")
        guess.add_color("red")
        guess.add_color("purple")
        expect(c.give_feedback(guess,code)) == {correct: 4, correct_colors: 0}
      end

      it "returns correct clues when the guess is correct in 3 "\
         "slots and incorrect in 1 slot" do
        c = Computer.new
        code = Pattern.new
        code.add_color("green")
        code.add_color("blue")
        code.add_color("red")
        code.add_color("purple")
        guess = Pattern.new
        guess.add_color("green")
        guess.add_color("blue")
        guess.add_color("red")
        guess.add_color("yellow")
        expect(c.give_feedback(guess,code)) == {correct: 3, correct_colors: 0}
      end

      it "returns correct clues when the guess is correct in 2 "\
         "slots and the last 2 slots switched" do
        c = Computer.new
        code = Pattern.new
        code.add_color("green")
        code.add_color("blue")
        code.add_color("red")
        code.add_color("purple")
        guess = Pattern.new
        guess.add_color("green")
        guess.add_color("blue")
        guess.add_color("purple")
        guess.add_color("red")
        expect(c.give_feedback(guess,code)) == {correct: 2, correct_colors: 2}
      end

      it "returns correct clues when the guess is correct in 1 "\
         "slot and the last 3 slots switched" do
        c = Computer.new
        code = Pattern.new
        code.add_color("green")
        code.add_color("blue")
        code.add_color("red")
        code.add_color("purple")
        guess = Pattern.new
        guess.add_color("green")
        guess.add_color("red")
        guess.add_color("purple")
        guess.add_color("blue")
        expect(c.give_feedback(guess,code)) == {correct: 1, correct_colors: 3}
      end

      it "returns correct clues when the guess is correct in 1 "\
         "slot and 2 correct colors" do
        c = Computer.new
        code = Pattern.new
        code.add_color("yellow")
        code.add_color("blue")
        code.add_color("purple")
        code.add_color("red")
        guess = Pattern.new
        guess.add_color("green")
        guess.add_color("red")
        guess.add_color("purple")
        guess.add_color("blue")
        expect(c.give_feedback(guess,code)) == {correct: 1, correct_colors: 2}
      end

      it "returns correct clues when the guess is correct in 1 slot only" do
        c = Computer.new
        code = Pattern.new
        code.add_color("yellow")
        code.add_color("blue")
        code.add_color("purple")
        code.add_color("red")
        guess = Pattern.new
        guess.add_color("yellow")
        guess.add_color("orange")
        guess.add_color("orange")
        guess.add_color("orange")
        expect(c.give_feedback(guess,code)) == {correct: 1, correct_colors: 0}
      end

      it "returns correct clues when the guess has 4 correct correct colors "\
         "but no correct slots" do
        c = Computer.new
        code = Pattern.new
        code.add_color("yellow")
        code.add_color("blue")
        code.add_color("purple")
        code.add_color("red")
        guess = Pattern.new
        guess.add_color("blue")
        guess.add_color("yellow")
        guess.add_color("red")
        guess.add_color("purple")
        expect(c.give_feedback(guess,code)) == {correct: 0, correct_colors: 4}
      end

      it "returns correct clues when the guess is completely incorrect" do
        c = Computer.new
        code = Pattern.new
        code.add_color("yellow")
        code.add_color("blue")
        code.add_color("purple")
        code.add_color("red")
        guess = Pattern.new
        guess.add_color("orange")
        guess.add_color("green")
        guess.add_color("orange")
        guess.add_color("green")
        expect(c.give_feedback(guess,code)) == {correct: 0, correct_colors: 0}
      end
    end

  end
end