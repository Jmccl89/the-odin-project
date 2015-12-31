class TicTacToe

  def initialize()
    puts 'Enter first player name:'
    @p1 = gets.chomp
    puts 'Enter second player name:'
    @p2 = gets.chomp
    @board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
    game_loop
  end

  def game_loop()
    first = rand(2)
    while @victor == nil
      draw()
      turn (first % 2 == 0 ? @p1 : @p2)
      first += 1
    end
    declare_victor()
  end

  def draw()
    puts ""
    puts "#{@board[0][0]}|#{@board[0][1]}|#{@board[0][2]}"
    puts "-+-+-"
    puts "#{@board[1][0]}|#{@board[1][1]}|#{@board[1][2]}"
    puts "-+-+-"
    puts "#{@board[2][0]}|#{@board[2][1]}|#{@board[2][2]}"
    puts ""
  end

  def turn(p)
    xo = p == @p1 ? 'x' : 'o'
    puts "#{p}, place your #{xo} (x,y):"
    move = gets.chomp.split(',')
    if @board[move[0].to_i] [move[1].to_i] == ' '
      @board[move[0].to_i] [move[1].to_i] = xo
      victory_check
    else
      puts 'Invalid move.'
      turn(p)
    end
  end

  def victory_check()

  end

  def declare_victor()

  end
end

TicTacToe.new()