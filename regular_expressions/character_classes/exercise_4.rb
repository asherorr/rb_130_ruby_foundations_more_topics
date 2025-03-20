#Write a regex that matches any letter except x or X
#Test it with these strings:

strings = ["0x1234", "Too many XXXXXXXXXXxxxxxxXXXXXXXXXXXX to count.", "The quick brown fox jumps over the lazy dog", "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"]

counter = 0

strings.each do |str|
  counter += str.scan(/[A-WYZa-wyz]/).length
end

p counter