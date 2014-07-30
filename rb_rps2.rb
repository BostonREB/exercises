game_play = {rock: {scissors: "crushes", lizard: "crushes"}, paper: {spock: "disproves", rock: "covers"}, scissors: {paper: "cuts", lizard: "decapitates"}, lizard: {paper: "eats", spock: "poisons"}, spock: {scissors: "smashes", rock: "vaporizes"}}
human_wins = 0
computer_wins = 0
ties = 0
game_count = 0

while true
  puts "Enter either Rock, Paper, Scissors, Lizard, or Spock. Or press enter to quit.\n\n"
  input = gets.chomp.downcase
  input == '' ? break : (input = input.downcase.to_sym)
  if game_play[input]
    puts "You played #{input.capitalize}"
    computer_play = game_play.keys.sample(1).first
    puts "The Computer played #{computer_play.capitalize}"
    if game_play[input][computer_play]
      puts "#{input.capitalize} #{game_play[input][computer_play]} #{computer_play.capitalize}. You win!!\n\n"
      human_wins = human_wins + 1
    elsif game_play[computer_play][input]
      puts "#{computer_play.to_s.capitalize} #{game_play[computer_play][input]} #{input.capitalize}.  The Computer Wins.  Loser.\n\n"
      computer_wins = computer_wins + 1
    else
      puts "You tied the computer"
      ties = ties + 1
    end
    game_count = game_count + 1
    puts "Human wins: #{human_wins}"
    puts "Computer wins: #{computer_wins}"
    puts "Tie games: #{ties}"
    puts "Games played: #{game_count}"
  else
    puts "Please enter a valid choice.\n\n"
  end
end
human_win_percent = human_wins/game_count*100
computer_win_percent = computer_wins/game_count*100
tie_percentage = ties/game_count*100
puts "You have played #{game_count} games.\n"
puts "You have won #{human_wins} times (#{human_win_percent}% winning percentage), the computer has won #{computer_wins} times (#{computer_win_percent}% winning percentage), and you tied #{ties} times (#{tie_percentage}% of games ended in a tie).\n\n"






