#PEDAC
#Problem
#write a program that takes an input as its letter
#and outputs it in diamond shape
#given a letter, it prints a diamond starting with "A"
#and the supplied letter at its widest point

#all rows, except first and last, have exactly 2 identical letters
#the diamond must be horizontally and vertically symmetric

#the top half has the letters in ascending order
#the bottom half has the letters in descending order

#implicit requirements:
#make_diamond method must return a single string using line continuation characters

#Example/Test Cases

#Data Structure
#input: uppercase letter (String)
#output: string object
#intermediate:
  #make an array of letters from A to the argument (ex E)
  #loop through each letter in the array
  #make a string with the letter and the correct number of spaces
  #concat it to a final string

#Algorithm
  #make an array of letters from A to the argument (ex E)
  #make a final string that's empty
  #loop through each letter in the array
  #build a string with the letter and the correct number of spaces (first half of string)
  #concat it to the final string

  #reverse the array, delete the first element (the middle number), then loop through each letter in the array
  #build a string with the letter and the correct number of spaces (second half of string)
  #concat it to the final string
  #return the final string

#--Subprocesses--
#Build a string with the letter and the correct number of spaces
  #helper method build_first_half(letter, original_argument_letter, letters_hash, spaces_between_letters_hash)
    #get the number of spaces needed on the sides
      #determine the position in the alphabet (make a hash. each letter is a key, with its position in the alphabet as the value.)
      #subtract the original argument letter's position from the current letter's position. that's the number of spaces.
    #determine if the letter is A
      #if it is, return a string with the number of side spaces, the letter, the number of side spaces, and a newline character
      #if it's not:
        #get the number of spaces between the letters
          #make a hash with each letter from B to Z as key, starting value as the value (starting value starts at 1)
          #as you build the hash, increment the starting value by 2 on each iteration.
          #use the hash value to represent the number of spaces 
          #return a string with the num of spaces, the letter, the number of spaces between the letter, the letter, num of outside spaces, then a newline character.

  #helper method build_second_half(letter, original_argument_letter)
    #get the number of spaces needed on the sides
      #determine the position in the alphabet (make a hash. each letter is a key, with its position in the alphabet as the value.)
      #subtract the original argument letter's position from the current letter's position. that's the number of spaces.
    #get the number of spaces between the letters
      #if the current letter is A, just insert A, with no spaces
      #else
        #make a hash with each letter from B to Z as key, starting value as the value (starting value starts at 1)
        #as you build the hash, increment the starting value by 2 on each iteration.
        #use the hash value to represent the number of spaces 
    #return a string with the num of spaces, the letter, the number of spaces between the letter, the letter, num of outside spaces, then a newline character.

class Diamond
  def self.hash_of_alphabet
    hash = {}
    counter = 1
    ("A".."Z").to_a.each do |letter|
      hash[letter] = counter
      counter += 1
    end

    hash
  end

  def self.make_spaces_between_letters_hash
    hash = {}
    counter = 1
    ("B".."Z").to_a.each do |letter|
      hash[letter] = counter
      counter += 2
    end

    hash
  end

  def self.build_string(letter, argument_letter, letters_hash, spaces_between_letters_hash)
    num_side_spaces = letters_hash[argument_letter] - letters_hash[letter]
    if letter == "A"
      return "#{" "*num_side_spaces}"+"#{letter}"+"#{" "*num_side_spaces}"+"\n"
    else
      return "#{" "*num_side_spaces}"+"#{letter}"+"#{" "*spaces_between_letters_hash[letter]}"+"#{letter}"+"#{" "*num_side_spaces}"+"\n"
    end
  end

  def self.build_first_half_of_string(final_str, argument_letter, letters_hash, spaces_between_letters_hash)
    letters = ("A"..argument_letter).to_a
    letters.each do |letter|
      final_str << build_string(letter, argument_letter, letters_hash, spaces_between_letters_hash)
    end
  end

  def self.build_second_half_of_string(final_str, argument_letter, letters_hash, spaces_between_letters_hash)
    letters = ("A"..argument_letter).to_a.reverse
    letters.delete_at(0)
    letters.each do |letter|
      final_str << build_string(letter, argument_letter, letters_hash, spaces_between_letters_hash)
    end
  end

  def self.make_diamond(argument_letter)
    letters_hash = self.hash_of_alphabet
    spaces_between_letters_hash = self.make_spaces_between_letters_hash

    final_str = ""
    build_first_half_of_string(final_str, argument_letter, letters_hash, spaces_between_letters_hash)
    build_second_half_of_string(final_str, argument_letter, letters_hash, spaces_between_letters_hash)
    final_str
  end
end