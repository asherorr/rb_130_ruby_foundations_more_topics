#Write a regex that matches any sequence of
#three characters delimited by whitespace characters
#(the regex should match both the delimiting whitespace)
#and the sequence of 3 characters
#Test it with these strings:

strings = ["red and blues", "the lazy cat sleeps"]

counter = 0
strings.each do |str|
  counter += str.scan(/\s...\s/).length
end

puts counter