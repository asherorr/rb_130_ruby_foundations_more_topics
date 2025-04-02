#PEDAC
#Problem
#write a problem that, given a word
#computes the scrabble score for that word.
#whitespace characters (space or characers following a slash) do not count
#nil must also score 0
#and the letters must be case insensitive

#Example/Test Case

#Data Structure
#input: String object (becomes a Scrabble object)
#output: integer (following score method)
#intermediate:
  #use a regex to test if the arg is a whitespace, an empty string, or nil (return 0 if so)
  #otherwise make a hash that contains each letter and its score
  #set a counter 
  #loop through each letter in the argument
  #increment the counter according to the score
  #return the score

#Algorithm
  #use a regex to test if the arg is a whitespace, an empty string, or nil (return 0 if so)
  #otherwise make a hash that contains each letter and its score
  #set a counter 
  #loop through each letter in the argument
  #increment the counter according to the score
    #loop through each key in the hash
    #loop through each letter in the array
    #if the upcased letter in the argument matches the key
    #increment the counter by the key's value
  #return the score

class Scrabble

  attr_reader :argument

  def initialize(argument)
    @argument = argument
  end

    SCRABBLE_SCORES = 
  { 
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
    ['D', 'G'] => 2,
    ['B', 'C', 'M', 'P'] => 3,
    ['F', 'H', 'V', 'W', 'Y'] => 4,
    ['K'] => 5,
    ['J', 'X'] => 8,
    ['Q', 'Z'] => 10
  }

  def is_invalid_arg?(str)
    return true if str == nil
    str.scan(/(\s|[\W])/).length > 0 || str == ""
  end

  def score
    return 0 if is_invalid_arg?(self.argument)

    counter = 0
    self.argument.chars.each do |letter|
      SCRABBLE_SCORES.each do |key, value|
        key.each do |key_letter|
          if letter.upcase == key_letter
            counter += value
          end
        end
      end
    end
    counter
  end

  def self.is_invalid_arg?(str)
    return true if str == nil
    str.scan(/(\s|[\W])/).length > 0 || str == ""
  end

  def self.score(argument)
    return 0 if is_invalid_arg?(argument)

    counter = 0
    argument.chars.each do |letter|
      SCRABBLE_SCORES.each do |key, value|
        key.each do |key_letter|
          if letter.upcase == key_letter
            counter += value
          end
        end
      end
    end
    counter
  end

end

p Scrabble.new('street').score
