#Write a regex that matches the last word in each
#line of text
#For this exercise, assume that words are any sequence
#of non-whitespace characters.
#Test your regex against these strings:

strings = [
  "What's up, doc?",
  "I tawt I taw a putty tat!",
  "Thufferin' thuccotath!",
  "Oh my darling, Clementine!",
  "Camptown ladies sing this song, doo dah."
]

matches = 0

strings.each do |str|
  matches += str.scan(/\b\S*$/).length
end

puts matches
