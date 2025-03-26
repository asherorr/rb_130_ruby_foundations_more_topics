#Write a regex that matches the last word
#in each line of text
#For this exercise, assume that wors are any sequence
#of non-whitespace characters. Test your regex against
#these strings:

strings = [
  "Mississippi",
  "ziti 0minimize7",
  "inviting illegal iridium"
]

matches = 0
strings.each do |str|
  matches += str.scan(/\b[a-z]*i[a-z]*i[a-z]*i[a-z]*/i).length
end

puts matches