#PEDAC
#Problem
#write a program that takes a string object
#and, when the `slices` method is invoked on the object
#returns an array of subarrays, with each element in the subarray
#representing a consecutive number series of the length specified
#by the argument passed to the slices method
#requirements:
#- if the argument passed to slices is greater than the length of the string, raise an ArgumentError

#Example/Test Cases

#Data Structure
#input:string object
#output: nested array (array of slices)
#intermediate:
  #convert the string arg to an array of integers
  #get all n-length subarrays of the slices 
  #place each subarray inside an array
  #return the array

#Algorithm
#convert the string arg to an array of integers
  #invoke chars on the arg
  #map a new array in which each character is converted to its integer form
#get all n-length subarrays of the slices 
  #loop through each index in the array
  #if the argument passed to slices is 1, just slice at the index..index
  #if the argument is greater than 1:
    #slice the array at current index + n unless the current index is the last
  #add each sliced array to a container array
#place
#return the array

class Series
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def get_array_of_digits
    self.str.chars.map {|i| i.to_i}
  end

  def slices(num)
    raise ArgumentError if num > self.str.length
    first_arr = get_array_of_digits
    final_arr = []

    first_arr.each_with_index do |_, idx|
      if num > 1
        final_arr << first_arr.slice(idx..(idx + (num - 1))) unless idx == first_arr.length - 1
      else
        final_arr << first_arr.slice(idx..idx) if num == 1
      end
    end

    final_arr.select {|arr| arr.length == num}
  end
end
end


series = Series.new('31001')
series.slices(3)