#Write a regex that matches any of the following fruits
#banana, apple, orange, apple, strawberry. The fruits may appear in other words
#Test it with these strings

fruits = ["banana", "orange", "pineapples", "strawberry", "raspberry", "grappler"]

fruits.each do |fruit|
  if fruit.match?(/banana|orange|apple|strawberry/)
    puts "It's a match for #{fruit}"
  else
    puts "It's not a match for #{fruit}"
  end
end


