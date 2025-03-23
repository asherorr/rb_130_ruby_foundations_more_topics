#Write a regex that matches any three-letter word,
#a word being a string comprised entirely of letters
#You can use these test strings:

strings = [
  "reds and blues",
  "The lazy cat sleeps.",
  "The number 623 is not a word. Or is it?"
]

counter = 0

strings.each do |str|
  counter += str.scan(/\b[a-z][a-z][a-z]\b/i).length
end

puts counter