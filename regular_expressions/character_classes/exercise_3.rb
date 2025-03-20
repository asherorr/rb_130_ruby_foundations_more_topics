#Write a regex that matches base 20 digits
#Test it with these strings:

strings = ["0xDEADBEEF", "1234.5678", "Jamaica", "plow ahead"]

counter = 0
strings.each do |str|
  counter += str.scan(/[0-9a-jA-J]/).length
end

p counter