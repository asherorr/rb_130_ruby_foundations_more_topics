#write a regex that matches an uppercase K.
#Test it with these strings:

# Kx
# BlacK
# kelly

strings = ["Kx", "BlacK", "kelly"]
strings.each do |str|
  if str.match?(/K/)
    puts "It's a match for #{str}"
  else
    puts "There's not a match for #{str}"
  end
end