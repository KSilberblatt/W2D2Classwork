require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :cursor, :board

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
  end

  # def get_input
  #   i = 0
  #   until i > 10
  #     @cursor.get_input
  #     puts @cursor.cursor_pos
  #     i += 1
  #     render
  #   end
  # end

  def render
    # @board.grid[0].each { |el| print "|#{el.to_s}| " }
    # puts ""
    # @board.grid[1].each { |el| print "|#{el.to_s}| " }
    # puts ""
    # @board.grid[2].each { |el| print "|#{el.to_s}| " }
    # puts ""
    # @board.grid[3].each { |el| print "|#{el.to_s}| " }
    # puts ""
    # @board.grid[4].each { |el| print "|#{el.to_s}| " }
    # puts ""
    # @board.grid[5].each { |el| print "|#{el.to_s}| " }
    # puts ""
    # @board.grid[6].each { |el| print "|#{el.to_s}| " }
    # puts ""
    # @board.grid[7].each { |el| print "|#{el.to_s}| " }
    # puts ""
    while true
      system('clear')
      @board.grid.each_with_index do |row, x|
        row.each_with_index do |el, y|
          pos = [x, y]
          if pos == @cursor.cursor_pos
            print " #{el.to_s} ".on_red
          else
            print " #{el.to_s} "
          end
        end
        puts ""
      end
      move_from = @cursor.get_input
      move_to   = @cursor.get_input
      @board[move_to]   = @board[move_from]
      @board[move_from] = NullPiece.instance
    end
  end

end

=begin
load 'display.rb'
d = Display.new
q
k = King.new([3, 3], 'b', :K)
n = Knight.new([1, 1], 'w', :N)
d.board[[3, 3]] = k
d.board[[1, 1]] = n
=end
