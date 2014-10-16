class Player
  attr_accessor :name, :mark, :order_player
  def initialize(name, mark, order)
    @name = name
    @order_player = order #player1, player2 etc
    @mark = mark #symbol player chooses to mark his cells
  end
end

class Cell
  attr_accessor :marked_by_player
  def initialize
    @marked_by_player = nil
  end
end

class Board
  attr_reader :board
  def initialize
    @board = []
    (0..6).each { @board.push(Array.new(6, nil))}
  end  

  def display_board
    puts "\n     0   1   2   3   4   5   6 "
    puts
    (0..5).each do |c_index|  
      print "   |"
      (0..6).each do |row|
          @board[row][c_index].nil? ? print("  "): print(" " + @board[row][c_index].marked_by_player.mark)
          print " |"
      end
    puts "\n   |---|---|---|---|---|---|---|" unless c_index == 5
    end
    puts "\n   -----------------------------"
  end

  def mark_position(col, player)
    cell = Cell.new
    cell.marked_by_player = player
    i = 5
    while ((board[col][i] != nil) && (i >= 0)) do
      i -= 1
    end
    if i >= 0
      board[col][i] = cell
      return check_win(col, i, player)
    end
    nil
  end

  def get_cell_mark(col, row)
    return @board[col][row].marked_by_player.mark if (col.between?(0,6) && row.between?(0,5) && @board[col][row] != nil)
    return nil
  end  

  def check_line(col, row, inc_col, inc_row)
    count = 1
    player_mark = get_cell_mark(col, row)
    i = inc_col
    j = inc_row
    next_mark = get_cell_mark(col + i, row + j)
    while !next_mark.nil?
      (next_mark == player_mark) ? count += 1 : break
      i += inc_col
      j += inc_row
      next_mark = get_cell_mark(col + i, row + j)
    end
    i = -inc_col
    j = -inc_row
    next_mark = get_cell_mark(col + i, row + j)
    while !next_mark.nil?
      (next_mark == player_mark) ? count += 1 : break
      i -= inc_col
      j -= inc_row
      next_mark = get_cell_mark(col + i, row + j)
    end
    return true if (count >= 4)
    return false    
  end

  def check_horizontal(col, row)
    return check_line(col, row, 1, 0)
  end

  def check_column(col, row)
    return check_line(col, row, 0, 1)
  end

  def check_diag1(col, row)
    return check_line(col, row, 1, 1)
  end

  def check_diag2(col, row)
    return check_line(col, row, 1, -1)
  end

  def check_win(col, row, player)
    return player.name if (check_horizontal(col, row) || check_column(col, row) || check_diag1(col, row) || check_diag2(col, row))
    return nil
  end

end

class Game
  attr_reader :game_board
  def initialize(board = nil)
    @game_board = board || Board.new
  end

  def player_turn(player)
    puts "\n#{player.order_player} '#{player.name}' turn"
    puts "choose column number"
    col = gets.chomp

    while ((col.length > 1) || !(col.match /[0-6]/) || (@game_board.board[col.to_i][0] != nil))
      puts "Invalid column number. Try again"
      col = gets.chomp
    end

    winner = game_board.mark_position(col.to_i, player)
    game_board.display_board
    
    if !winner.nil?
      puts("\n#{player.order_player}: " + winner + " won the game\n")
      return true
    end
    nil
  end

  def menu
    puts "Name of player1:"
    name_p1 = gets.chomp
    puts "Name of player2:"
    name_p2 = gets.chomp
    @player1 = Player.new(name_p1, "O", "player1")
    @player2 = Player.new(name_p2, "X", "player2")
    turns = 42
    game_board.display_board
    loop do
      break if player_turn(@player1)
      turns -= 1
      break if turns == 0
      break if player_turn(@player2)
      turns -= 1
      break if turns == 0
    end
    puts "\nThe game ended with a tie\n" if turns == 0
  end

end


#g = Game.new
#g.menu

