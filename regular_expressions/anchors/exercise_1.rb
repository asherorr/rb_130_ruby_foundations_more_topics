#Write a regex that matches the word "The" when it occurs
#at the beginning of a line. Test it with these strings:

strings = [
  "The lazy cat sleeps.",
  "The number 623 is not a word.",
  "Then, we went to the movies.",
  "Ah. The bus has arrived."
]

counter = 0
strings.each do |str|
  counter += str.scan(/^The\b/).length
end

puts counter