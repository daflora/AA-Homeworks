class Board
  attr_accessor :cups

  def initialize(name1, name2)
    #how do I look up the index of name1 so as to relate to the player class or file?
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    (0..5).each {|idx| @cups[idx] =[:stone,:stone,:stone,:stone]}
    (7..12).each {|idx| @cups[idx]=[:stone,:stone,:stone,:stone]}

    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos <= 5 && start_pos >= 0
    raise 'Invalid starting cup' unless start_pos >= 7 && start_pos <= 12
  end

  def make_move(start_pos, current_player_name)
    stones_in_hand = @cups[start_pos].count
    @cups[start_pos] = nil

    placement = (start_pos + 1) % 14
    until stones_in_hand == 0
      if stones_in_hand + start_pos == (-1)+ 7 * (1)#@side)
        next
      else
        @cup[placement] << :stone
        placement += 1
        stones_in_hand -= 1
      end
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup == []} || cups[7..12].all? {|cup| cup == []}
  end

  def winner

  end
end

class InvalidStartError < StandardError
  puts "Invalid starting cup"

end
