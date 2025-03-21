#Write a regex that matches any character that is 
#not a letter, a space, a carriage return, or a 
#line feed.
#Test it with these strings:

strings = ["0x1234abcd", "1,000,000,000s and 1,000,000,000s.", "THE quick BROWN fox JUMPS over THE lazy DOG!"]

counter = 0
strings.each do |str|
  counter += str.scan(/[^a-z \r\n]/i).length
end

puts counter