# frozen_string_literal: true
require_relative 'board.rb'


class TicTacToe
  def initialize
    @marks = {
      'X' => 'Player 1',
      'O' => 'Player 2'
    }
    @turn = 1
    @board = Board.new(@marks)
    @playing = true
    @message = nil
    @winner = nil
  end

  def reset
    @board.reset
    @turn = 1
    @winner = nil
    start
  end

  def current_symbol
    @turn.odd? ? 'X' : 'O'
  end

  def take_turn(input)
    if @board.full?
      set_tie
    end

    if @board.update(input, current_symbol) == false
      @message = "Please select an empty box!"
      return
    end
    @turn = @turn + 1

    if @board.full?
      set_tie
    end
  end

  def set_tie
    puts "Tie!"
    finish
  end

  def set_winner(mark)
    @winner = @marks[mark]
    puts "Congratulations #{@winner} win the game!"
    finish
  end

  def print_message
    if @message
      puts @message
    end
    @message = nil
  end

  def print_turn
    puts "Player ##{@turn.odd? ? 1 : 2} turn"
  end

  def start
    while @playing do
      @board.show
      print_message
      print_turn
      inp = -1
      until inp.between?(1,9) do
        print "Pick a number [1-9] "
        inp = gets.chomp.to_i
      end
      take_turn(inp)
    end
  end

  def finish
    @board.show

    print "Game Finished, any key to continue "
    ans = gets.chomp

    if ans.eql?"q"
      exit
    end

    self.reset unless @playing
  end

  def exit
    puts "Good bye!"
    @playing = false
  end
end

