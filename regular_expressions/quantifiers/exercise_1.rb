#Write a regex that matches any word
#that begins with `b` and ends with an `e`
#and has any number of letters in-between.
#You may limit your regex to lowercase letters
#Test it with these strings:

strings = [
  "To be or not to be",
  "Be a busy bee",
  "I brake for animals."
]

counter = 0

strings.each do |str|
  counter += str.scan(/\bb\w*e\b/).length
end

puts counter