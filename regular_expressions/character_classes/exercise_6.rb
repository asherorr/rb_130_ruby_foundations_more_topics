#Write a regex that matches a string that looks like
#a negated cjaracter class range, eg [^a-z].
#Your answer should match precisely the six characters
#The match does not include the slash characters.
#Test it with these strings:

string = "The regex /[^a-z]/i matches any character that is
not a letter. Similarly, /[^0-9]/ matches any
non-digit while /[^A-Z]/ matches any character
that is not an uppercase letter. Beware: /[^+-<]/
is at best obscure, and may even be wrong."

puts string.scan(/\[\^[0-9a-z]-[0-9a-z]\]/i).length