 board = ["X"," "," "," "," "," "," "," "," "]
 puts "Welcome to Tic Tac Toe!"
 puts display_board(board)
 turn(board)
 play(board)

 def won?(board)
   WIN_COMBINATIONS.detect do |win_combination|
     win_combination.all? { |win_index| board[win_index] == "X" } ||
     win_combination.all? { |win_index| board[win_index] == "O" }
   end
 end

 win = lines.any? do |line|
     line.all? { |row,col| board[row][col] == current_player }
   end

   if win

     puts "#{current_player} wins!"
     exit
   end

   if board.flatten.compact.length == 9
     puts "It's a draw!"
     exit
   end

# Define your play method below

 def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

 win_conditions = [
   [0, 1, 2],
   [0, 3, 6],
   [0, 4, 8],
   [1, 4, 7],
   [2, 5, 8],
   [2, 4, 6],
   [3, 4, 5],
   [6, 7, 8],
 ]

 def input_to_index(input)
 # convert input to integer and subtract 1.
   input.to_i - 1

 end

 def move(board, index, symbol)
   board[index] = symbol
 end

 def position_taken?(board, index)
   if board[index] == " " || board[index] == "" || board[index] == nil # safety measures
       taken = false
     elsif board[index] == "X" || board[index] == "O"
       taken = true
   end
 end

 def valid_move?(board, index)
   index.between?(0,8) && !position_taken?(board, index)

 end

 def turn(board)
   puts "Please enter 1-9:"
     userInput = gets.strip # gets the user input and calls input_to_index
     index = input_to_index(userInput)
     if !valid_move?(board, index) # asks for input again after a failed validation
       turn(board)
     else # makes valid moves
       move(board, index, current_player(board))
     end
   display_board(board)
 end


 def turn_count(board)
   # counts occupied positions
   count = 0
   board.each do |index|
     if index != " "
       count += 1
     end
   end
     count
  end

 def current_player(board)
   if turn_count(board) % 2 == 0

     return "X"
   else

     return "O"
   end
 end

 def won?(board)
   win_conditions.each do |win|

   if win.all?{|y| board[y] == "X"}
     return win
     elsif win.all?{|y| board[y] == "O"}
       return win
     end
   end
   return false
 end

 def full?(board)
   board.all? do |position|
     position == "X" || position == "O"
   end
 end

 def draw?(board)
   # true if no winner and board is full
   !(won?(board)) && full?(board)
 end

     def over?(board)
       if full?(board) == true
         return true
       end
       return false
     end

 def winner(board)

  if (draw?(board) || !full?(board)) && !won?(board)
     return nil
   elsif (board[won?(board)[0]] == "X")
     return "X"
   elsif (board[won?(board)[0]] == "O")
     return "O"
   end
 end

 def play(board)
   while !over?(board) && !won?(board) && !draw?(board) # if the game isnt over
     turn(board) # play another turn
   end

 # if the game is over
   if won?(board)
    puts "Congratulations #{winner(board)}!"
  end

 # if its a draw
  if draw?(board)
    puts "Cats Game!"
  end

 end
