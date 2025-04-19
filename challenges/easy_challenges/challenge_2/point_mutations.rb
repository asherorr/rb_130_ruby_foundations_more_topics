#PEDAC

#Problem
#write a program that can calculate the Hamming distance between 2 DNA strands
#this is, in effect, a count of the number of differences (different characters)
#between a supplied DNA strand and a test DNA strand

#implicit requirements:
#if I have two sequences of unequal length, compute the Hamming distance over the shorter length
#empty strands are allowed
#`hamming_distance` is the instance method to use. It should return an Integer

#Example/Test Cases

#Data Structure
#input:
  #string object passed to constructor for DNA object
  #string object passed to `hamming_distance` instance method
#output:
  #instance method should return an integer

#intermediate:
  #convert the test string and argument string into an array of characters
  #loop through elements 0 through size of the string passed to the constructor
  #use a counter to track the number of differences

#Algorithm
  #convert the test string and argument string into an array of characters
  #loop through elements 0 through size of the shortest string (either the original string or the one passed as an argument)
    #helper method shortest_string(other_strand)
      #put both strings in an array
      #return the minimum by string length
    #make a range from 0 through the size of the shortest strand minus 1 (represents indexes)
    #if the element at current idx of original strand is not equal to other strand
    #increment the counter
  #use a counter to track the number of differences
  #return the counter

#Code
class DNA

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    shortest_strand = shortest_strand(other)
    counter = 0

    (0...shortest_strand.length).each do |idx|
      counter += 1 if strand[idx] != other[idx]
    end

    counter
  end

  private
  
  attr_reader :strand

  def shortest_strand(other)
    [self.strand, other].min_by {|str| str.length}
  end
end

