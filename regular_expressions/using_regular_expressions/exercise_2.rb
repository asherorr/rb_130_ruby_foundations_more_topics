#Write a method that returns all
#of the fields in a haphazardly formatted string
#A variety of spaces, tabs, and commas
#separate the fields, with possibly multiple
#occurences of each delimeter

def fields(text)
  p text.split(/[,\t ]+/)
end

fields("Pete,201,Student")     # ["Pete", "201", "Student"]
fields("Pete \t 201   ,  TA")  # ["Pete", "201", "TA"]
fields("Pete \t 201")          # ["Pete", "201"]
fields("Pete \n 201")          # ["Pete", "\n", "201"]