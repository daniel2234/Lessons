require 'pry'
# Constant values that store markers
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
# method that takes in message
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "#{msg}"
end

# displays the board
def display_board(brd, score)
  system 'clear'
  display_score(score)
  puts "You are a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |       |"
  puts "  #{brd[1]}  |   #{brd[2]}   |   #{brd[3]}"
  puts "     |       |"
  puts "-----+-------+-----"
  puts "     |       |"
  puts "  #{brd[4]}  |   #{brd[5]}   |   #{brd[6]}"
  puts "     |       |"
  puts "-----+-------+-----"
  puts "     |       |"
  puts "  #{brd[7]}  |   #{brd[8]}   |   #{brd[9]}"
  puts "     |       |"
  puts ""
end

# initialize the board
def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select{|num| brd[num] == INITIAL_MARKER}
end

def joinor(arr, delimiter = ', ', word = "or")
  arr[-1] = "#{word} #{arr.last}"
  arr.join(delimiter)
end
# mutates based on player decision
def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
      prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  #defense
  WINNING_LINES.each do |line|
    square = find_a_square_at_risk(line, brd, PLAYER_MARKER)
    break if square
  end

  if !square
      WINNING_LINES.each do |line|
      square = find_a_square_at_risk(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  if !square
  square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  #bang bang will return a boolean value if no string is returned
  !!detect_winner(brd)
end

def detect_winner(brd)
    WINNING_LINES.each do |line|
     if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
     elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
     end
  end
  nil
end

def display_score(score)
  score.each {|key, value| puts "#{key} is #{value}"}
end

def game_score(winner, score)
  if winner == "Player"
    score["Player Score"] += 1
  else winner == "Computer"
    score["Computer Score"] += 1
  end
end

def game_winner?(score, score_winning)
  score["Player Score"] == score_winning || 
  score["Computer Score"] == score_winning
end

def find_a_square_at_risk(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

loop do
  game_score = {"Player Score"=>0, "Computer Score"=>0}
  winning_score = 5
    loop do
      board = intialize_board

      loop do
        display_board(board, game_score)
  
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)

        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      end

      display_board(board, game_score)
      game_score(detect_winner(board), game_score)

      if someone_won?(board)
        prompt "#{detect_winner(board)} won!"
      else
        prompt "Its a tie!"
      end

      prompt "Play again? (y or n)"
      answer = gets.chomp
      break unless answer.downcase.start_with?('y')
    end
    break if game_winner?(game_score, winning_score)      
end
prompt "Thanks for playing!"
