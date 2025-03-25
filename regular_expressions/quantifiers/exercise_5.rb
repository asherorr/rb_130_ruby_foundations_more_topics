#Modify your regex from the previous exercise
#so the URL can have optional leading or trailing
#whitespace, but is otherwise on a line by itself.
#To test your regex with trailing whitespace, you must
#add some spaces to the end of some lines in your sample text.

#There should be 3 matches.

strings = [
  "https://launchschool.com/   ",
  "http://mail.google.com/mail/u/0/#inbox   ",
  "htpps://example.com",
  "Go to http://launchschool.com/",
  "https://user.example.com/a.cgi?a=p&c=0 hello",
  "    https://launchschool.com/"
]

counter = 0

strings.each do |str|
  counter += str.scan(/^\s*https?:\/\/\S*\s*$/).length
end

puts counter