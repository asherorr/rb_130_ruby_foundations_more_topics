#Write a select method that mirrors the behavior of Array#select

def select(array)
  counter = 0
  final_arr = []
  
  while counter < array.size
    final_arr.push(array[counter]) if yield(array[counter]) == true
    counter += 1
  end
  
  final_arr
end

p select([1, 2, 3]) {|num| num.even?}
p select([1, 2, 3]) {|num| num.odd?}