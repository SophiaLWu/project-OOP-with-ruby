require "spec_helper"

module Mastermind
  describe Computer do

    context "#initialize" do
      it "raises an error when initialized without arguments" do
        expect { Computer.new }.to raise_error(ArgumentError)
      end

      it "does not raise an error when initialized with a role" do
        expect { Computer.new("codebreaker") }.to_not raise_error
      end
    end

    context "#give_feedback" do
      it "returns correct clues when the guess is identical "\
         "to the secret code" do
        c = Computer.new("codemaker")
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
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(4)
        expect(clues[:correct_color]).to eq(0)
      end

      it "returns correct clues when the guess is correct in 3 "\
         "slots and incorrect in 1 slot" do
        c = Computer.new("codemaker")
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
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(3)
        expect(clues[:correct_color]).to eq(0)
      end

      it "returns correct clues when the guess is correct in 2 "\
         "slots and the last 2 slots switched" do
        c = Computer.new("codemaker")
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
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(2)
        expect(clues[:correct_color]).to eq(2)
      end

      it "returns correct clues when the guess is correct in 1 "\
         "slot and the last 3 slots switched" do
        c = Computer.new("codemaker")
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
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(1)
        expect(clues[:correct_color]).to eq(3)
      end

      it "returns correct clues when the guess is correct in 1 "\
         "slot and 2 correct colors" do
        c = Computer.new("codemaker")
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
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(1)
        expect(clues[:correct_color]).to eq(2)
      end

      it "returns correct clues when the guess is correct in 1 slot only" do
        c = Computer.new("codemaker")
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
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(1)
        expect(clues[:correct_color]).to eq(0)
      end

      it "returns correct clues when the guess has 4 correct correct colors "\
         "but no correct slots" do
        c = Computer.new("codemaker")
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
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(0)
        expect(clues[:correct_color]).to eq(4)
      end

      it "returns correct clues when the guess is completely incorrect" do
        c = Computer.new("codemaker")
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
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(0)
        expect(clues[:correct_color]).to eq(0)
      end

      it "does not give multiple clues when there are duplicate colors "\
         "in guess but only one in code" do
        c = Computer.new("codemaker")
        code = Pattern.new
        code.add_color("blue")
        code.add_color("orange")
        code.add_color("green")
        code.add_color("red")
        guess = Pattern.new
        guess.add_color("purple")
        guess.add_color("blue")
        guess.add_color("blue")
        guess.add_color("blue")
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(0)
        expect(clues[:correct_color]).to eq(1)
      end

      it "does not give multiple clues when there are duplicate colors "\
         "in guess and multiple in code" do
        c = Computer.new("codemaker")
        code = Pattern.new
        code.add_color("blue")
        code.add_color("orange")
        code.add_color("blue")
        code.add_color("red")
        guess = Pattern.new
        guess.add_color("purple")
        guess.add_color("blue")
        guess.add_color("purple")
        guess.add_color("blue")
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(0)
        expect(clues[:correct_color]).to eq(1)
      end

      it "does give clue to a correct color when there is also a peg "\
         "in guess with the same color, but also correct position" do
        c = Computer.new("codemaker")
        code = Pattern.new
        code.add_color("blue")
        code.add_color("orange")
        code.add_color("blue")
        code.add_color("red")
        guess = Pattern.new
        guess.add_color("blue")
        guess.add_color("blue")
        guess.add_color("purple")
        guess.add_color("purple")
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(1)
        expect(clues[:correct_color]).to eq(1)
      end

      it "does not give duplicate clues when two are completely correct" do
        c = Computer.new("codemaker")
        code = Pattern.new
        code.add_color("purple")
        code.add_color("blue")
        code.add_color("green")
        code.add_color("purple")
        guess = Pattern.new
        guess.add_color("purple")
        guess.add_color("red")
        guess.add_color("green")
        guess.add_color("blue")
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(2)
        expect(clues[:correct_color]).to eq(1)
      end

      it "does not give duplicate clues when one is completely correct #2" do
        c = Computer.new("codemaker")
        code = Pattern.new
        code.add_color("purple")
        code.add_color("blue")
        code.add_color("green")
        code.add_color("purple")
        guess = Pattern.new
        guess.add_color("red")
        guess.add_color("green")
        guess.add_color("blue")
        guess.add_color("purple")
        clues = c.give_feedback(guess,code)
        expect(clues[:correct_slot]).to eq(1)
        expect(clues[:correct_color]).to eq(2)
      end

    end

    context "#give_pattern" do
        it "returns a random guess when there are no previous guesses" do
            c = Computer.new("codebreaker")
            colors = ["red", "orange", "yellow", "green", "blue", "purple"]
            code = Pattern.new
            code.add_color("purple")
            code.add_color("blue")
            code.add_color("green")
            code.add_color("purple")
            pattern = c.give_pattern(code, [], colors)
            expect(pattern.colors.size) == 4
            only_colors = pattern.colors.all? do |color|
                color == :R || color == :O || color == :Y || color == :G ||
                color == :B || color == :P
            end
            expect(only_colors).to eq(true)
        end

        it "retains correct colors in previous guess when making a new guess" do
            c = Computer.new("codebreaker")
            colors = ["red", "orange", "yellow", "green", "blue", "purple"]
            code = Pattern.new
            code.add_color("purple")
            code.add_color("blue")
            code.add_color("green")
            code.add_color("purple")
            guess1 = Pattern.new
            guess1.add_color("purple")
            guess1.add_color("yellow")
            guess1.add_color("green")
            guess1.add_color("yellow")
            new_guess = c.give_pattern(code, [guess1], colors)
            expect(new_guess.colors[0]).to eq(:P)
            expect(new_guess.colors[2]).to eq(:G)
        end

        it "retains correct colors in multiple previous guesses "\
           "when making a new guess" do
            c = Computer.new("codebreaker")
            colors = ["red", "orange", "yellow", "green", "blue", "purple"]
            code = Pattern.new
            code.add_color("purple")
            code.add_color("blue")
            code.add_color("green")
            code.add_color("purple")
            guess1 = Pattern.new
            guess1.add_color("purple")
            guess1.add_color("yellow")
            guess1.add_color("yellow")
            guess1.add_color("yellow")
            guess2 = Pattern.new
            guess2.add_color("purple")
            guess2.add_color("blue")
            guess2.add_color("yellow")
            guess2.add_color("red")
            new_guess = c.give_pattern(code, [guess1, guess2], colors)
            expect(new_guess.colors[0]).to eq(:P)
            expect(new_guess.colors[1]).to eq(:B)
        end
    end

  end
end