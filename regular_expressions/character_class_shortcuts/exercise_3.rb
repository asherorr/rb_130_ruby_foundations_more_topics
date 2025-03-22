#Write a regex that matches any sequence of three letters
#Test it with these strings:

strings = [
  "The red d0g chases the b1ack cat.",
  "a_b c_d"
]

counter = 0
strings.each do |str|
  counter += str.scan(/[a-z][a-z][a-z]/i).length
end

puts counter