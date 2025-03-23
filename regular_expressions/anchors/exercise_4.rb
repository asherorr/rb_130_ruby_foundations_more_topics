#Write a regex that matches an entire line of text
#that consists of exactly 3 words as follows:
#- the first word is A or The
#- there is a single space between the first and second words
#- the second word is any 4-letter word
#- there is a single space between the second and third words
#- the third word - the last word - is either dog or cat

strings = [
  "A grey cat",
  "A blue caterpillar",
  "The lazy dog",
  "The white cat",
  "A loud dog",
  "--A loud dog",
  "Go away dog",
  "The ugly rat",
  "The lazy, loud dog"
]

counter = 0

strings.each do |str|
  counter += str.scan(/^(The|A)\b [a-z][a-z][a-z][a-z]\b (dog|cat)\b/).length
end

puts counter