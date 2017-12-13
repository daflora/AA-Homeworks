require_relative 'board.rb'
# # require ''
require 'colorize'

class Display
  attr_reader :board



  def initialize(board)
    @board = board
  end
end


a = Board.new
b = Board.new
p a
b.move_piece([4,4],[3,3])
a.move_piece([1,1],[1,3])
p a
p b 
display(a)
