class RockPaperScissors
  attr_accessor :game_play

  def initialize
    @game_play = {
      rock: {scissors: "crushes", lizard: "crushes"},
      paper: {spock: "disproves", rock: "covers"},
      scissors: {paper: "cuts", lizard: "decapitates"},
      lizard: {paper: "eats", spock: "poisons"},
      spock: {scissors: "smashes", rock: "vaporizes"}
    }

    @counter_moves = {
      rock: ["paper", "spock"],
      scissors: ["rock", "spock"],
      lizard: ["rock", "scissors"],
      paper: ["scissors", "lizard"],
      spock: ["paper", "lizard"]
    }

    @human_wins = 0
    @computer_wins = 0
    @ties = 0
    @game_count = 0
    @human_picks = []
  end

  def ai_selects
    frequent_pick = @human_picks.group_by { |pick| pick }.values
    count_high = 0
    options = []
    frequent_pick.each do |value|
      pick_count = value.count
      if pick_count >= count_high
        count_high = pick_count
      end
      if value.count == count_high
        value.each do |value|
          options << value
        end
      end
    end
    likely_move = options.sample(1).first.to_sym
    computer_play = @counter_moves[likely_move].sample(1).first.to_sym
  end

  def play_game
    while true
      puts "Enter either Rock, Paper, Scissors, Lizard, or Spock. Or press enter to quit.\n\n"
      input = gets.chomp.downcase
      @human_picks << input
      input == '' ? break : (input = input.downcase.to_sym)
      if game_play[input]
        puts "You played #{input.capitalize}"
        find_winner(input)
      else
        puts "Please enter a valid choice.\n\n"
      end
    end
    display_stats
  end

  def compare_selections(input, computer_play)
    if game_play[input][computer_play]
      puts "#{input.capitalize} #{game_play[input][computer_play]} #{computer_play.capitalize}. You win!!\n\n"
      @human_wins += 1
    elsif game_play[computer_play][input]
      puts "#{computer_play.to_s.capitalize} #{game_play[computer_play][input]} #{input.capitalize}.  The Computer Wins.  Loser.\n\n"
      @computer_wins += 1
    else
      puts "You tied the computer"
      @ties += 1
    end
  end

  def find_winner(input)
    if @game_count > 1
      computer_play = ai_selects
    else
      computer_play = game_play.keys.sample(1).first
    end
    puts "The Computer played #{computer_play.to_s.capitalize}"
    compare_selections(input, computer_play)
    @game_count += 1
  end

  def display_stats
    human_win_percent = sprintf("%.f", (@human_wins.to_f/@game_count.to_f)*100)
    computer_win_percent = sprintf("%.f", (@computer_wins.to_f/@game_count.to_f)*100)
    tie_percentage = sprintf("%.f", (@ties.to_f/@game_count.to_f)*100)
    puts "You have played #{@game_count} games.\n"
    puts "You have won #{@human_wins} times (#{human_win_percent}% winning percentage), the computer has won #{@computer_wins} times (#{computer_win_percent}% winning percentage), and you tied #{@ties} times (#{tie_percentage}% of games ended in a tie).\n\n"
  end

end

rpsls = RockPaperScissors.new
rpsls.play_game
