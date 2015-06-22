class Board
  attr_accessor :board
  def initialize
    @board = Array.new(3," "){Array.new(3," ")}
    @empty = " "
  end
  
  def draw_board
    @board.each_with_index do |x,i|
      puts x.join("|")
      unless i == 2
        puts "-----"
      end
    end
  end
  
  def is_full?
    @board.include?(@empty) ? true : false
  end
  
  def space_empty?(row,col)
    @board[row][col] == @empty ? true : false
  end
  
  def check_space(row, col)
    @board[row][col]
  end
  
  def place_team(row, col, team)
    @board[row][col] = team
  end
end

class Player
  attr_accessor :name, :team
  def initialize(name, team)
    @name = name
    @team = team
  end
end

class TicTacToe
  attr_accessor :board, :player_1, :player_2
  def initialize
    @board = Board.new
    @player_1 = Player.new("Player 1", "X")
    @player_2 = Player.new("Player 2", "O")
    @winner = nil
  end
  
  def start_game
    
  end
  
  def show_instructions
    
  end
  
  def nextTurn
    
  end
  
  def winner?
    
  end
end

board = Board.new()
board.draw_board
if board.space_empty?(1,2)
  puts "True"
else
  puts "False"
end

board.place_team(1,2,"X")

board.draw_board
if board.space_empty?(1,2)
  puts "True"
else
  puts "False"
end

