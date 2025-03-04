#Write a method that returns a list of all the divisors of the positive integer
#passed in as an argument
#the return value can be in any sequence you wish

def divisors(num)
  final_arr = []
  #make a range of all numbers from 1 through the arg
  range = (1..num).to_a
  range.each { |test_num| final_arr << test_num if num % test_num == 0 }
  p final_arr 
  #test if each number is a positive divisor
  #if it is, add it to a final array
end

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute