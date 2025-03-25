#Write a regex that matches any line of text
#That contains nothing but a URL.
#For this exercise, a URL begins with
#http:// or https://, and continues until
#it detects a whitespace character or end of line.
#Test your regex using these strings:

strings = [
  "https://launchschool.com/",
  "http://mail.google.com/mail/u/0/#inbox",
  "htpps://example.com",
  "Go to http://launchschool.com/",
  "https://user.example.com/a.cgi?a=p&c=0 hello",
  "    https://launchschool.com/"
]

counter = 0

strings.each do |str|
  counter += str.scan(/^https?:\/\/\S*$/).length
end

puts counter