#Write a method that takes a sorted array of integers as an argument
#and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

def missing(arr)
  range = ((arr.min + 1)...arr.max).to_a
  range.select { |num| arr.include?(num) == false}
end

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []