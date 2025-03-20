#Write a regex that matches uppercase or lowercase K's
#or a lowercase s. Test it with these strings:

strings = ["Kitchen Kaboodle", "Reds and blues", "kitchen Servers"]

counter = 0

strings.each do |str| 
  counter += str.scan(/[Kks]/).length
end

puts counter