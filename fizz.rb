100.times do |number|
  digit = number + 1
  if digit % 15 == 0
    puts "FizzBuzz"
  elsif digit % 3 == 0
    puts "Fizz"
  elsif digit % 5 == 0
    puts "Buzz"
  else
    puts digit
  end
end
