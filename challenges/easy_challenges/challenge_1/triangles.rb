#PEDAC

#Problem
#write a program to determine whether a triangle
#is equilateral, isosceles, or scalene.

#an equilateral triangle has all 3 sides the same length
#an isoceles triangle has exactly 2 sides of the same length
#a scalene triangle has all sides of different lengths

#for a shape to be considered a triangle
#all sides must have a length that is greater than 0
#and the sum of the lengths of any two sides
#must be greater than the length of the third side

#implicit requirements:
#raise an ArgumentError if an invalid triangle (all 3 sides 0) is passed to the constructor
#as an argument

#raise an ArgumentError if any side is negative

#Example/Test Cases

#Data Structure
#input:
  #3 integers passed to constructor (side1, side2, side3)
#output:
  #string object "isoceles", "scalene", or "equilateral"
#intermediate:
  #place all 3 sides into an array
  #use the array to determine if the triangle is valid
  #use the array to determine the type of triangle (get number of unique elements)

#Algorithm
  #place all 3 sides into an array
  #use the array to determine if the triangle is valid
    #helper method valid_triangle?
      #check if minimum element in the array is over 0
      #AND check whether the sum of lengths of any two sides us greater than the third
        #(first and second greater than third, first and third greater than second, and second and third greater than first))
  
  #if the triangle is invalid, raise an ArgumentError in the constructor
  #use the array to determine the type of triangle
    #get the number of unique elements in the array (use unique method, then call size on that array)
      #if the size is 1, it's equilateral
      #if the size is 2, it's isoceles
      #or else it's scalene

class Triangle
  attr_accessor :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid lengths" unless valid_triangle?
  end

  def valid_triangle?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[0] + sides[2] > sides[1] &&
    sides[1] + sides[2] > sides[0]
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end
end