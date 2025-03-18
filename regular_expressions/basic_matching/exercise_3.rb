#Write a regex that matches the string `dragon`.
#Test it with these strings:

# snapdragon
# bearded dragon
# dragoon

strings = ["snapdragon", "bearded dragon", "dragoon"]
strings.each do |str|
  if str.match(/dragon/)
    puts "It's a match for #{str}"
  else
    puts "There isn't a match for #{str}"
  end
end

