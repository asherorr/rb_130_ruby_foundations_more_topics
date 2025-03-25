#Write a regex that matches any line of text
#That ends with a ?
#But does match a line that consists
#Entirely of a single `?`
#Test it with the strings from the previous exercise

strings = ["What's up, doc?", "Say what? No way.", "?", "Who? What? Where? When? How?"]

counter = 0

strings.each do |str|
  counter += str.scan(/\b[?]$/).length
end

puts counter