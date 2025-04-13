#PEDAC
#Problem
#write a program that manages robot factory settings
#when robots come off the factory floor, they have no name
#the first time you boot the them up, a random name 
#with two capital letters and three digits is given (RX872)
#when a robot is reset to its factory settings, their name
#gets wiped. the next time I ask tis name, with a `name` method`,
#it responds with a random name
#the names should be random, they should not follow a predictable sequence
#random names means there is a risk of collissions. 
#the solution should not allow the use of the same name twice

#implicit requirements:
#test cases utilize a `name` instance method
#test cases utilize a `reset` instance method
#different robot objects can't have the same name

#Test Cases/Example

#Data Structure
#input: none
#output: string object (its name)
#intermediate:
  #when a robot object is instantiated, use a class variable (points to a Hash) to track the robot object (key) and its name (value)
    #ensure that the name generated does not already exist as a value
  #the name method is a getter -> pull it from the Hash class variable
  #the reset method assigns a new name to the value for the robot object in the hash

#Algorithm
#--High-Level--
#Build a class variable hash that tracks each Robot object that's instantiated
#When a robot object is instantiated, give it a random name that's not a value in the hash
  #helper method `assign_name`
    #make a loop
    #generate a string of two random capital letters and 3 random numbers
      #make an array of 2 elements
      #map over it
      #in the block, make an array of all capital letters from A to Z
      #sample a letter
      #join the returned array to get a string
      #repeat the process with numbers
      #concat the letters and the numbers together
    #determine if it's not a value in the hash object that tracks each robot object
      #helper method name_available?
        #loop through each key:value pair in the @@robots hash
        #select objects where the value equals the possible name
        #check if the array that's returned is empty (if it is, the name is available)
    #break out of the loop if the helper method returns true
    #return the string object
#Create the `name` getter method which gets the value associated with the robot object in the class variable hash
#When a robot object is reset, give it a random name that's not a value in the hash
  #use helper method `assign_name`

class Robot
  @@robots = {}

  def initialize
    robot_name = assign_name
    @@robots[self] = robot_name
  end

  def assign_name
    name = ""
    loop do
      letters = (0..1).map { ("A".."Z").to_a.sample }.join
      numbers = (0..2).map { (0..9).to_a.sample }.join
      name = letters + numbers
      break if name_available?(name)
    end
    name
  end

  def name_available?(possible_name)
    @@robots.select { |key, value| value == possible_name }.empty?
  end

  def name
    @@robots[self]
  end

  def reset
    @@robots[self] = assign_name
  end
end