#Write a regex that matches the word `cat`
#when it occurs at the end of a line.
#Test it with these strings:

strings = [
  "The lazy cat sleeps",
  "The number 623 is not a cat",
  "The Alaskan drives a snowcat"
]

counter = 0

strings.each do |str|
  counter += str.scan(/\bcat$/).length
end

puts counter