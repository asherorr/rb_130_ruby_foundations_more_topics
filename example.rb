def introduce_myself(name, &block)
  puts "Hello! My name is #{name}."
  list_programming_languages(block) if block_given?
end

def list_programming_languages(block)
  puts "I can code in #{block.call}."
end

introduce_myself("Asher") {"Ruby and Python"}