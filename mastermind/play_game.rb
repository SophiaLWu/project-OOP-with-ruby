require_relative "lib/mastermind"

# new_board = Mastermind::Board.new
# new_p = Mastermind::Pattern.new
# new_p.add_color("red")
# new_p.add_color("orange")
# new_p.add_color("yellow")
# new_p.add_color("green")
# c = Mastermind::Computer.new
# c.clues[:correct] = 2
# c.clues[:correct_color] = 1
# new_board.add_block(new_p, f)
# new_board.add_block(new_p, f)
# puts new_board.formatted_board

g = Mastermind::Game.new("Sophia")
g.play