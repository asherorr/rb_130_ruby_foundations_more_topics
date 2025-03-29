# - no size can be illegal
# - a negative size will trigger an ArgumentError
# - the sum of the lengths of ANY 2 sides must be greater than the length of the third side

class Triangle
  attr_accessor :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid lengths" unless valid_triangle?
  end

  def valid_triangle?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
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

tri = Triangle.new(2, 3, 2)