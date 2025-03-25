#Write a regex that matches any line
#of text that ends with a ?
#test it with these strings

strings = ["What's up, doc?", "Say what? No way.", "?", "Who? What? Where? When? How?"]

counter = 0
strings.each do |str|
  counter += str.scan(/[?]$/).length
end

puts counter