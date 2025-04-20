#PEDAC

#Problem
#write a program that converts a number
#to roman numerals

#implicit requirements:
  #number passed to the RomanNumeral#new method must be an integer
  #roman numeral must be a string of all capital letters

#Example/Test Cases

#Data Structure
#input: integer (passed to RomanNumeral#new method)
#output: String object representing Roman Numeral
#intermediate:
  #make a hash that maps digits 0-9 to roman numeral representations by place value
    #the digit is the key, and an array of each roman numeral (in string form) by place value is the value
  #index 0 is ones, index 1 is tens place, index 2 is hundreds place, index 3 is thousands place
  #get an array of each digit passed in as an argument, then reverse it
  #iterate over each digit with index (index represents the place value)
  #use the hash (access the place value associated with the digit)

#Algorithm
  #make a hash that maps digits 0-9 to roman numeral representations by place value
    #the digit is the key, and an array of each roman numeral (in string form) by place value is the value
  #get an array of each digit passed in as an argument, then reverse it
  #iterate over each digit with index (index represents the place value)
  #use the hash (access the place value associated with the digit)

class RomanNumeral
  CONVERSION = {
    1 => ["I", "X", "C", "M"],
    2 => ["II", "XX", "CC", "MM"],
    3 => ["III", "XXX", "CCC", "MMM"],
    4 => ["IV", "XL", "CD"],
    5 => ["V", "L", "D"],
    6 => ["VI", "LX", "DC"],
    7 => ["VII", "LXX", "DCC"],
    8 => ["VIII", "LXXX", "DCCC"],
    9 => ["IX", "XC", "CM"],
    0 => ""
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    number_reversed = @number.digits

    roman_numerals_array = number_reversed.map.with_index do |digit, idx|
      CONVERSION[digit][idx]
    end

    roman_numerals_array.reverse.join
  end
end

