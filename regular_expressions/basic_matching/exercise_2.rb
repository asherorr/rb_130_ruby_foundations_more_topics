#Write a regex that matches an uppercase or lowercase H
#Test it with these strings:

# Henry
# perch
# golf

strings = ["Henry", "perch", "golf"]
strings.each do |str|
  if str.match?(/h/i)
    puts "It's a match for #{str}"
  else
    puts "It's not a match for #{str}"
  end
end

