#PEDAC
#Problem
#write a program that converts an octal number to a decimal number
#if an invalid input is used (like a str with a non-digit character), return 0

#Examples/Test Cases

#Data Structure
#input: string object
#output: integer object
#intermediate: 
  #use a helper method to validate the input
  #if the input is valid, convert it to an array of integers
  #multiply each number accordingly (map onto a new array) and sum the array

#Algorithm
#Use a helper method to validate the input
  #scan the string for any instances of a non-digit
  #check the length of the array returned
  #if it's greater than 0, return false
  #else return true

#If the input is valid, convert the number
  #convert str to an array of integers
  #reverse the array
  #multiply each num and map it onto a new array
    #set a variable that represents the exponent to 0
    #loop through each element in the array
    #multiply the element by 8 to the nth power
    #increment the power by 1
  #sum the array

#Return the array

class Octal
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def valid_input?(str)
    str.scan(/[\D]|[89]/).length == 0
  end
  
  def convert(str)
    array_of_nums = str.chars.map {|ele| ele.to_i}.reverse
    starting_exponent = 0
  
    array_of_nums.map! do |num|
      number = num * (8 ** starting_exponent)
      starting_exponent += 1
      number
    end
    array_of_nums.sum
  end
  
  def to_decimal
    if valid_input?(str)
      convert(str)
    else
      return 0
    end
  end
end

