#Write a regex that matches lines of text
#that contain at least 3, but no more than 6,
#consecutive comma separated numbers
#You may assume that every number on each line
#is both preceded by and followed by a comma.
#Test your regex against these strings:

strings = [
  ",123,456,789,123,345,",
  ",123,456,,789,123,",
  ",23,56,7,",
  ",13,45,78,23,45,34,",
  ",13,45,78,23,45,34,56,"
]

matches = 0

strings.each do |str|
  matches += str.scan(/(,\d+,\d*){3,6}/).length
end

puts matches

