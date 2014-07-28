game_play = {rock: {scissors: "crushes", lizard: "crushes"}, paper: {spock: "disproves", rock: "covers"}, scissors: {paper: "cuts", lizard: "decapitates"}, lizard: {paper: "eats", spock: "poisons"}, spock: {scissors: "smashes", rock: "vaporizes"}}
counter_moves = {rock: ["paper", "spock"], scissors: ["rock", "spock"], lizard: ["rock", "scissors"], paper: ["scissors", "lizard"], spock: ["paper", "lizard"]}
human_wins = 0
computer_wins = 0
ties = 0
game_count = 0
human_picks = []

def ai_selects(frequent_pick, counters)
  frequent_pick = frequent_pick.to_sym
  puts "RIGHT HERE #{counters[frequent_pick]}"
  computer_play = counters[frequent_pick].sample(1).first.to_sym
end

while true
  puts "Enter either Rock, Paper, Scissors, Lizard, or Spock. Or press enter to quit.\n\n"
  input = gets.chomp.downcase
  human_picks << input
  input == '' ? break : (input = input.downcase.to_sym)
  frequent_pick = human_picks.group_by { |val| val }.values.max_by(&:size).first
  if game_play[input]
    puts "You played #{input.capitalize}"
    puts game_count
    computer_play = ai_selects(frequent_pick, counter_moves)
    puts "The Computer played #{computer_play.to_s.capitalize}"
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
human_win_percent = sprintf("%.f", (human_wins.to_f/game_count.to_f)*100)
computer_win_percent = sprintf("%.f", (computer_wins.to_f/game_count.to_f)*100)
tie_percentage = sprintf("%.f", (ties.to_f/game_count.to_f)*100)
puts "You have played #{game_count} games.\n"
puts "You have won #{human_wins} times (#{human_win_percent}% winning percentage), the computer has won #{computer_wins} times (#{computer_win_percent}% winning percentage), and you tied #{ties} times (#{tie_percentage}% of games ended in a tie).\n\n"
puts "#{frequent_pick}"





