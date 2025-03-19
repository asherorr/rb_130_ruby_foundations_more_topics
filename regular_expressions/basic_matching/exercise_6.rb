#Write a regex that matches blueberry or blackberry
#but write berry precisely once.
#Test it with these strings:

berries = ["blueberry", "blackberry", "black berry", "strawberry"]

berries.each do |berry|
  if berry.match?(/(blue|black)berry/)
    puts "There's a match for #{berry}."
  else
    next
  end
end

