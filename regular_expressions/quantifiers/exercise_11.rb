#Write a regex that matches lines of text
#that contain at least 3, but no more than 6,
#consecutive comma-separated numbers.
#in this exercise, you can assume that the first number
#on each line is NOT preceded by a comma
#and the last number is NOT followed by a comma

#Test your regex against these strings:

strings = [
  "123,456,789,123,345",
  "123,456,,789,123",
  "23,56,7",
  "13,45,78,23,45,34",
  "13,45,78,23,45,34,56"
]

matches = 0

strings.each do |str|
  matches += str.scan(/^(\d+,){2,5}\d+$/).length
end

puts matches
