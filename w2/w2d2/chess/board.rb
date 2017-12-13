require 'byebug'
# require 'display.rb'

class Board
  attr_reader :grid



  def initialize(grid = :new)
    # @grid = Array.new(8) {Array.new(8)}
    unless grid == :new
      @grid = grid
    else
      self.setup
    end
  end

  def setup
    @grid = Array.new(8) {[:pawn,:pawn,nil,nil,nil,nil,:pawn,:pawn]}
  end

  def [](pos)
    col, row = pos
    @grid[col][row]
  end

  def []= (pos)
    col, row = pos#[0],pos[1]
    @grid[col][row]
  end

  def move_piece(start_pos, end_pos)
      # debugger
    begin
      unless valid_move?(start_pos, end_pos)
        puts "Invalid move! Please try again. : "
      end
    rescue  #!valid_move(start_pos, end_pos)
        puts "Invalid move! Please try again. : "
        # print "Starting : "
        # start_pos = [gets.chomp[0],gets.chomp[-1]]
        # print "\nEnding : "
        # end_pos = [gets.chomp[0],gets.chomp[-1]]
        # retry# retry

    end

    captured = self[end_pos]
    moving = self[start_pos]
    @grid[end_pos[0]][end_pos[1]] = moving
    @grid[start_pos[0]][start_pos[1]] = nil
  end

  def valid_move?(start_pos, end_pos)
    if self[start_pos] == nil
      raise "No piece to move at start."
      return false
    elsif self[end_pos] == :pawn
      raise "Your #{self[start_pos]} cannot get there."
      return false
    end
    return true
  end

end


# class Piece(type = nil)
# #placeholder class right now - eventually gets own file
#   attr_reader :type
#   def initialize
#     @type = type
#   end
# # end
# # end

# a = Board.new
# p a
# # a.move_piece([4,4],[3,3])
# a.move_piece([1,1],[1,3])
# p a
# display(a)
