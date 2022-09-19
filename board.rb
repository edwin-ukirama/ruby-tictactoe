class Board
  def initialize(marks)
    @grid = Array.new(9)
    @marks = marks
  end

  def show
    puts "\n\n\n"
    @grid.each_with_index do |box, index|
        unless box
          print "|#{index+1}|"
        else
          print "|#{box}|"
        end
        if (index+1) % 3 == 0
            puts "\n"
        end
    end
    puts "\n"
  end

  def reset
    @grid = Array.new(9)
  end

  def update(num, symbol)
    index = num - 1
    if @grid[index]
      return false
    end
    @grid[index] = symbol
    return check_win_condition
  end

  def full?
    @grid.select{ |box| box == nil }.length == 0
  end

  def check_win_condition
    # currently there are two approach that i can solve this
    # 1. Hardcode the rules into an 2d array index, and then loop over it
    # 2. Manually adding rules in if conditions
    # or maybe a combination between those two?

    # 1st approach
    rules =[
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ].freeze
    @marks.each do |mark, value|
      # #2 approach
      # 3.times do |i|
      #   if @grid[i] == mark and @grid[i+3] == mark and @grid[i+6] == mark
      #     set_winner(mark)
      #   end
      # end

      # if @grid[0] == mark and @grid[4] == mark and @grid[8] == mark or
      #   @grid[2] == mark and @grid[4] == mark and @grid[6] == mark
      #   set_winner(mark)
      # end
      rules.each do |rule|
        if @grid[rule[0]] == mark && @grid[rule[1]] == mark && @grid[rule[2]] == mark
          return @mark
        end
      end
    end
  end
end
