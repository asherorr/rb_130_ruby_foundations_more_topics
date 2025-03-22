#Write a regex that matches any 4 digit hexadecimal number
#That is both preceded and followed by whitespace.
#Note that 0x1234 is not a hexadecimal number
#in this exercise: there is no space before the number 1234.

strings = [
  "Hello 4567 bye CDEF - cdef",
  "0x1234 0x5678 0xABCD",
  "1F8A done"
]

counter = 0
strings.each do |str|
  counter += str.scan(/\s\h\h\h\h\s/).length
end

puts counter