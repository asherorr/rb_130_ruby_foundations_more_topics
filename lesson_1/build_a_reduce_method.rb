#Try to write a reduce method on your own that exhibits the behavior of Enumberable#reduce
#Your reduce should take at least 1 argument that represents the array we'll operate on. 
#It should also take an optional second argument that represents the default value for the accumulator.

def reduce(arr, acc=0)
  indexes = (0...arr.size)

  indexes.each do |index|
    current_element = arr[index]
    acc = yield(acc, current_element)
  end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass