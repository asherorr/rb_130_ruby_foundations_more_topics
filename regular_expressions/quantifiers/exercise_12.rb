#Write a regex that matches lines of text
#that contain either 3 comma separated numbers
#or 6 or more comma separated numbers
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
  matches += str.scan(/(^(\d+,){2}\d+$|^(\d+,){5,}\d+$)/).length
end

puts matches