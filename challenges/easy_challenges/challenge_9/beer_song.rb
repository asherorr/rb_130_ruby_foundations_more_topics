#PEDAC
#Problem
#write a program that can generate the lyrics of the 99 bottles of beer song
#there should be a class method, `verse`, which takes one or more arguments:
  #which is the number of bottles
#and outputs the lyrics to the song for the verses

#there should be another class method, lyrics, that outputs the whole song

#Example/Test Cases

#Data Structure (verse class method)
#input: integer
#output: string object
#intermediate:
  #use a string with a spots for interpolation

#Algorithm (verse class method)
#place the arguments into an array
#if the size of the array is greater than 1, find the maximum and minimum of the array
#make an array of the range from the minimum number to the maximum number
#then reverse the array
#loop through each number in the array and map the verse
#

#return a 

class BeerSong
  def self.verse(*args)
    max = args.max
    min = args.min

    arr = (min..max).to_a.reverse
    lines = arr.map do |num|
      self.return_verse(num)
    end

    final_str = ""
    if lines.size > 1
      lines.each {|line| final_str << line +"\n"}
    else
      lines.each {|line| final_str << line}
    end
    final_str
  end

  def self.verses(*args)
    max = args.max
    min = args.min

    arr = (min..max).to_a.reverse
    lines = arr.map do |num|
      self.return_verses(num)
    end

    final_str = ""
    if lines.size > 1
      lines.each do |line| 
        if line == lines[-1]
          final_str << line
        else
          final_str << line + "\n"
        end
      end
    else
      lines.each {|line| final_str << line}
    end
    final_str
  end

  def self.return_verses(verse_number)
      if verse_number > 2
      "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\nTake one down and pass it around, #{verse_number - 1} bottles of beer on the wall.\n"
      elsif verse_number == 2
        "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\nTake one down and pass it around, #{verse_number - 1} bottle of beer on the wall.\n"
      elsif verse_number == 1
        "#{verse_number} bottle of beer on the wall, #{verse_number} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
      elsif verse_number == 0
         "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
  end

  def self.return_verse(verse_number)
    if verse_number > 2
    "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\nTake one down and pass it around, #{verse_number - 1} bottles of beer on the wall.\n"
    elsif verse_number == 2
      "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\nTake one down and pass it around, #{verse_number - 1} bottle of beer on the wall.\n"
    elsif verse_number == 1
      "#{verse_number} bottle of beer on the wall, #{verse_number} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    elsif verse_number == 0
       "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def self.lyrics
    self.verses(0, 99)
  end
end

p BeerSong.lyrics