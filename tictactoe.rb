class Board
  def initialize
    @board = Array.new(3, " "){Array.new(3, " ")}
    @empty = " "
  end
  
  def show_board
    @board.each_with_index do |x, i|
      puts x.join("|")
      unless i == 2
        puts "-----"
      end
    end
  end
  
  def is_full?
    flag = true
    @board.each do |x|
      if x.include?(@empty)
        flag = false
      end
    end
    return flag
  end
  
  def space_empty?(row,col)
    @board[row][col] == @empty ? true : false
  end
  
  def check_space(row,col)
    @board[row][col]
  end
  
  def place_symbol(row,col,symbol)
    @board[row][col] = symbol
  end
  
end

class Player
  attr_accessor :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Game
  def initialize
    puts "Enter name of player 1 (X)"
    @player_1_name = gets.chomp
    puts "Enter name of player 2 (O)"
    @player_2_name = gets.chomp
    @board = Board.new
    @player_1 = Player.new(@player_1_name, "X")
    @player_2 = Player.new(@player_2_name, "O")
    @current_player = @player_1
    play_game
  end
  
  def play_game
    until @board.is_full?
      unless is_winner?
        take_turn
      else
        show_results
        break
      end
    end
  end
  
  def take_turn
    @board.show_board
    puts "#{@current_player.name}, it is your turn."
    loop do
      puts "Choose an empty space to place your symbol: row#,column#"
      space = gets.chomp.split(",").map{|s| s.to_i - 1}
      if @board.space_empty?(space[0], space[1])
        @board.place_symbol(space[0], space[1], @current_player.symbol)
        unless is_winner?
          switch_players
        end
        break
      else
        puts "That space is not empty"
      end
    end
  end
  
  def switch_players
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end
  
  def is_winner?
    win = false
    win_positions = [
      [[0,0],[0,1],[0,2]],
      [[1,0],[1,1],[1,2]],
      [[2,0],[2,1],[2,2]],
      [[0,0],[1,1],[2,2]],
      [[0,2],[1,1],[2,0]],
      [[0,0],[1,0],[2,0]],
      [[0,1],[1,1],[2,1]],
      [[0,2],[1,2],[2,2]]
      ]
    
    win_positions.each do |positions|
      symbols = Array.new
      positions.each do |pos|
        symbols << @board.check_space(pos[0],pos[1]).to_s
      end
      if symbols.all?{|x| x == "X"} || symbols.all?{|x| x == "O"}
        win = true
      end
    end
    return win
  end
  
  def show_results
    @board.show_board
    puts "You win #{@current_player.name}!"
  end
end

game_1 = Game.new




  