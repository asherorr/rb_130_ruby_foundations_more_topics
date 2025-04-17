#PEDAC

#Problem
#create a clock that is independent of date
#this means to return a string from an #at
#class method that takes two arguments
#a mandatory argument specifying the hour (ie 8),
#and an optinal argument specifying the minutes
#clock objects must define an +, -, and == method.
#modifications to the clock must not mutate the Clock object
#instead it should return a new one

#the time should also wrap around midnight
#ie if the hour is 23, and the minutes are 30,
#and 60 is added, '00:30' is returned

#Example/Test Case

#Data Structure
#input: 
  #one mandatory argument (num specifying hour)
  #one optional argument (num specifying minutes)
#output: String object

#intermediate:
  #use a constant that points to an integer of the maximum number of mins in a day
  #use a constant that points to an integer of the minimum number of mins in a day
  #determine the total number of minutes from the value passed to at
  #divide it by 60 (result represents full hours, remainder represents minutes)
  #format the result and remainder to get a string representation of the time

  #in the case of a wraparound before/after midnight, use the modulo operator
  #with the calculated minutes on the left hand side, and the maximum number of minutes on the right hand side

#Algorithm
#get total number of minutes
  #make constant for maximum num of mins in 24-hour period 
  #make constant for minimum num of mins in a 24-hour period
  #make a class method self with a mandatory hour arg and optional minute arg
  #return a new clock object with total number of minutes ((hour * 60) + minutes) passed as argument
  #make an initialize method with an instance variable @minutes, so it can be passed around in class

#handle total number of minutes when there's a wraparound (before/after midnight)
  #for + method, pass mins as arg
  #instantiate a new Clock object that adds @minutes + mins, then modulos by MAX_MINS (if no wraparound, modulo will not affect the number)
  #for - method, same logic except mins arg is subtracted from @minutes

#convert the total number of minutes into a string representation
  #divide minutes by 60 and get result and remainder (use divmod)
  #format result and remainder into a string representation of HH:MM (two nums wide on each side, lead with 0s)

#test clock objects for equality
  #compare the number of minutes to the other clock's number of minutes
  
  class Clock
    MAX_MINS = 1440
    MIN_MINS = 0

    attr_reader :minutes
  
    def self.at(hour, minutes=0)
      new(hour * 60 + minutes)
    end
  
    def initialize(minutes)
      @minutes = minutes
    end
  
    def +(mins)
      Clock.new((@minutes + mins) % MAX_MINS)
    end
  
    def -(mins)
      Clock.new((@minutes - mins) % MAX_MINS)
    end
  
    def ==(other_clock)
      @minutes == other_clock.minutes
    end
  
    def to_s
      hrs, mins = @minutes.divmod(60)
      format('%02d:%02d', hrs, mins)
    end
  end