#first, I defined the new_board method to create and hold variables for empty squares on grid
	def new_board
	  @a1 = " "
	  @a2 = " "
	  @a3 = " "
	  @b1 = " "
	  @b2 = " "
	  @b3 = " "
	  @c1 = " "
	  @c2 = " "
	  @c3 = " "
	end
	 
	#then, I defined the squares method to turn the empty squares into an array
	def squares
	  [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
	  
	end
	 
	def win_combos 
	  [[@a1, @a2, @a3],
	  [@a1, @b2, @c3],
	  [@a1, @b1, @c1],
	  [@b1, @b2, @b3],
	  [@c1, @c2, @c3],
	  [@c1, @b2, @a3],
	  [@a2, @b2, @c2],
	  [@a3, @b3, @c3]]
	  
	end
	 
 def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

	 
	#def method to check if user's choice of move is valid/available. this should be called only after the player has had 3 turns but I don't know how to do that. 
	def check_validity square_availability
	  if square_availability == " "
	    true
	  else
	    puts "That space is taken. Get your own!"
	  end
	end
	 
	def user_turn
	  user_choice_hash = {"a1" => @a1,
	                      "a2" => @a2,
	                      "a3" => @a3,
	                      "b1" => @b1,
	                      "b2" => @b2,
	                      "b3" => @b3,
	                      "c1" => @c1,
	                      "c2" => @c2,
	                      "c3" => @c3}
	                    
	 
	  puts "Please choose a square:"
	  user_choice = STDIN.gets.chomp.downcase
	  user_choice_hash.each do |choice, square|
	    if user_choice == choice 
	      if check_validity(square)
	        square.sub!(" ", "X")
	        display_board
	      end
	    elsif user_choice == "q" or user_choice == "quit"
	      exit
	    end
	  end
	  #check_for_winner
	end
	 
	def comp_turn
	  squares.shuffle.each do |square|
	    if check_validity(square)
	      square.gsub!(" ", "O")
	      break
	    end
	  end
	  #check_for_winner
	end
	 
	def check_for_winner 
	  win_combos.each do |combos| 
	    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
	      puts "Computer wins! Good luck next time."
	      exit 
	    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
	      puts "You win! Good job!"
	      exit
	    #else
	      #puts "Tie! Enter q to quit game."
	    end
	  end
	end
	 
	def start_game
	  puts "Welcome to my Tic Tac Toe game!"
	  puts "To place your X on the grid, enter the location (ex--a1, b3)."
	  puts "To quit, enter q at any time"
	end
	 
	def run_game
	  start_game
	  new_board
	  while true
	    display_board
	    user_turn
	    comp_turn
	  end
	end
	 
	run_game
