# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below

win_conditions = [[0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8],]
  
def win_conditions
end

def over?(board)
      if full?(board) == true
        return true
      end
      return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def won?(board)
  win_conditions do |win|
  if win.all?{|y| board[y] == "X"}
    return win
    elsif win.all?{|y| board[y] == "O"}
      return win
    end
  end
  return false
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def play(board)
  while !over?(board) && !won?(board) && !draw?(board)
  turn(board)
  end
  if won?(board)
    puts "Congratulations winner!"
  end
  if draw?(board)
    puts "Draw"
  end
end

def turn_count(board)
  count = 0
  board.each do |index|
    if index != " "
      count += 1
    end
  end
    count
 end