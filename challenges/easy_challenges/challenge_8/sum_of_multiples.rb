#PEDAC
#Problem
#write a program that, given a natural number and 
#a set of one or more other numbers
#can find the sum of all the multiples of
#the numbers in the set that are less than the first number
#the set of numbers will be passed to the class
#as an instance variable
#if a set of numbers is not given, use a 
#default set of 3 and 5

#other requirements:
#with no argument passed, `to` is a class method
#with an argument passed upon instantiating the object, to is an instance method

#Example/Test Cases

#Data Structure
#input: integer object (for to method)
#output: integer object
#intermediate:
  #the set is a series of nums
  #use an array to store the numbers
  #iterate through each number and get the multiples that are less than the target num
  #store this in an array, then flatten the array
  #sum the array

#Algorithm
#--Subprocesses--
#store the multiples that are less than the target num in an array
  #make a range of numbers 1 through the target num
  #make an empty array
  #loop through each number in the set (outer loop)
  #loop through each number in the range (inner loop)
  #if the inner loop num is a multiple of the outer loop num, add it to the array
  #get the uniq numbers in the array
  #sum the array

class SumOfMultiples

  attr_reader :arr

  def initialize(*args)
    defaults = [3, 5]
    @arr = args.empty? ? defaults : args
  end

  def self.to(target_num)
    set = [3, 5]
    range = (1...target_num)

    multiples = set.flat_map do |num|
      range.select { |possible_multiple| possible_multiple % num == 0 }
    end
    
    multiples.uniq.sum
  end

  def to(target_num)
    set = self.arr
    range = (1...target_num)

    multiples = set.flat_map do |num|
      range.select { |possible_multiple| possible_multiple % num == 0 }
    end
    
    multiples.uniq.sum
  end
end