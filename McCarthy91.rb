@steps = -1

def m91(number)
  while number != 91
    @steps += 1
    if number > 100
      number = number - 10
    else number <= 100
      number = number + 11
    end
  end
  puts "#{@steps} steps were needed to reach #{number}"
end

puts "Please enter a number"
print ">"
number = gets.chomp.to_i
m91(number)
