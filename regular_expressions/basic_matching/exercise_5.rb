#Write a regex that matches a comma or space
#Test your regex with these strings:

# This line has spaces
# This,line,has,commas,
# No-spaces-or-commas

strings = ["This line has spaces", "This,line,has,commas,", "No-spaces-or-commas"]

match_count = 0

strings.each do |str|
  match_count += str.scan(/( |,)/).length
end

puts "Total matches: #{match_count}"

