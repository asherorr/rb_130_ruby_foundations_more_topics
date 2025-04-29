#PEDAC

#Problem
#Write a program that constructs objects which represents
#a meetup date
#Each object takes a month number (1-12) and a year (like 2021)
#The object should be able to determine the exact date of the meeting in the specifified month and year
#example: you ask for the 2nd Wednesday of May 2021, the object should determine the meetup will occur on the 12th of May, 2021.
#descriptors that are given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'
#case of the strings is irrelevant
#each day of the week will have exactly one date that is teenth of that day in every month
#every month has exactly one teenth monday, one teenth Tuesday,a nd so on

#days of the week are given by these strings:
  #Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'
  #case is not important/irrelevant

#implicit requirements:
#use 'date' library
#meetup object takes a year (ex: 2012) and a month (11)
#that are integers
#meetup object has instance method `Meetup#day` that takes two arguments
#the day (ie "Saturday" and the occurence 'third')
#it must match a Date object - that is, the Meetup#day instance method
#must return a Date object

#if there isn't a date - like, no fifth Wednesday in October 2015 - then return `nil`


#Example/Test Cases

#Data Structure (Meetup#day method)
#input: two strings (Day of week, that month's week)
#output: Date object
#intermediate:
  #get first day of the month Date object
  #get last day of the month Date object
  #make a hash of with key:value pairs of date in the month (key) and its weekday (value)
  #find the date of the month associated with the nth occurence of the weekday
  #if it's `nil`, return nil. Otherwise plug that date into a `Date.civil` object.
  #return the Date.civil object

#Algorithm
  #get first day of the month Date object
  #get last day of the month Date object
    #helper method get_first_and_last_day_of_month(year, month)

  #make a hash of with key:value pairs of date in the month (key) and its weekday (value)
  #find the date of the month associated with the nth occurence of the weekday
    #method Meetup#day
      #first handle 'teenth' occurence argument
        #if it's teenth, loop through each key:value pair in the hash
        #if the key is included in a range of 13-19 (array) and the value is equivalent to the weekday passed in
        #return the date key
        #otherwise return `nil`
      #convert the occurence into an integer (case-insensitive)
            #take the occurence that's passed as an argument
            #downcase it
            #if it's 'first', return 1, and so on through 5
          #set a counter to 0
          #check if the occurence passed is valid (return nil if not)
            #helper method valid_occurence?
              #get the values in the hash in an array
                #loop through each value (downcase each value) and select values that match the day of the week passed as an argument
              #if the size of that array is less than the integer, it's invalid. short-circuit the method to return nil
          #loop through each key:value pair
          #if the value equals the day passed in (be sure to lowercase them), increment the counter by 1
          #when the counter is equivalent to the occurence integer, return the key associated with the key:value pair (day of the month)

        #if it's `nil`, return nil. Otherwise plug that date into a `Date.civil` object.
        #return the Date.civil object


require 'date'

class Meetup

  attr_reader :year, :month, :date_and_weekday_hash

  def initialize(year, month)
    @year = year
    @month = month
    @date_and_weekday_hash = hash_of_each_day_in_month_and_its_weekday
  end

  def get_first_and_last_day_of_month
    first_day = Date.new(self.year, self.month, 1)
    last_day = Date.new(self.year, self.month, -1)
    [first_day, last_day]
  end

  def hash_of_each_day_in_month_and_its_weekday
    first_day = get_first_and_last_day_of_month[0]
    last_day = get_first_and_last_day_of_month[1]
    range = (1..last_day.day)
    hash = {}

    range.each do |day_number|
      weekday = (Date.new(self.year, self.month, day_number)).strftime("%A")
      hash[day_number] = weekday
    end
    hash
  end

  def convert_occurence_to_integer(occurence)
    if occurence.downcase == "first"
      return 1
    elsif occurence.downcase == "second"
      return 2
    elsif occurence.downcase == "third"
      return 3
    elsif occurence.downcase == "fourth"
      return 4
    elsif occurence.downcase == "fifth"
      return 5
    end
  end

  def valid_occurence?(day, occurence_in_month)
    occurences = self.date_and_weekday_hash.values.select do |weekday|
      day.downcase == weekday.downcase
    end
    if occurences.size < occurence_in_month
      return false
    else
      return true
    end
  end

  def find_date_number(day_as_string, occurence)
    occurence_as_num = convert_occurence_to_integer(occurence)
    counter = 0
    return nil unless valid_occurence?(day_as_string, occurence_as_num)
    date_and_weekday_hash.each do |key, value|
      counter += 1 if value.downcase == day_as_string.downcase
      return key if counter == occurence_as_num
    end
  end

  def day(day_as_string, occurence)
    if occurence.downcase == "last"
      possible_dates = self.date_and_weekday_hash.select do |key, value|
        (1..31).to_a.include?(key) && value.downcase == day_as_string.downcase
      end
      possible_dates = possible_dates.keys
      return nil if possible_dates.empty?
      date_number = possible_dates[-1]
      Date.civil(self.year, self.month, date_number)
    elsif occurence.downcase == "teenth"
      possible_dates = self.date_and_weekday_hash.select do |key, value|
        (13..19).to_a.include?(key) && value.downcase == day_as_string.downcase
      end
      possible_dates = possible_dates.keys
      return nil if possible_dates.empty?
      date_number = possible_dates[0]
      Date.civil(self.year, self.month, date_number)
    else
      date = find_date_number(day_as_string, occurence)
      return nil if date == nil
      Date.civil(self.year, self.month, date)
    end
  end
end

# test = Meetup.new(2013, 3)
test = Meetup.new(2016, 2)
p test.day('Sunday', 'fifth')