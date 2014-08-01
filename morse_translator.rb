require 'csv'

def english_to_morse
  puts "Please enter the word, phrase or senetence you wish to convert into Morse Code."
  input = gets.chomp.upcase
  input = input.split("")
  @coded = []
  input.each do |letter|
    if letter == " "
      character = "  "
    else
      character = @old_time[letter]
    end
    @coded << character
  end
  puts "The translation is: #{@coded.join(" ")}"
end

def morse_to_english
  puts "Please enter the Morse Code for the word, phrase or senetence you wish to convert into English."
  input = gets.chomp
  input = input.split(/ /)
  @coded = []
  @code_set = @old_time.invert
  input.each do |code|
    if code == " "
      character = " "
    else
      character = @code_set[code]
    end
    @coded << character
  end
  puts "The translation is: #{@coded.join(" ")}"
end

@old_time = {}
CSV.foreach("morse_codes.csv", { :col_sep => "," }) do |column|
  alpha, code = column
  @old_time[alpha] = code
end

puts "Welcome to the Morse Code Translator"
puts "To translate from English to Morse Code enter 1"
puts "To translate from Morse Code to English enter 2"
language = gets.chomp
if language == "1"
  english_to_morse
elsif language == "2"
  morse_to_english
else
  puts "Please enter either 1 or 2"
end
