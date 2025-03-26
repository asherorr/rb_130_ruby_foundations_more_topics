#Modify your regex from the previous exercise
#so the URL can appear anywhere on each line
#as long as it begins at a word boundary

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
  counter += str.scan(/\bhttps?:\/\/\S*/).length
end

puts counter