#PEDAC
#Problem
#write a program that can tell whether a number is perfect, abundant, or deficient
#a perfect number has an aliquot sum that is equal to the original number (divisor does not include the target number itself)
#an abundant number has an aliquot sum that is greater than the original number
#deficient numbers have an aliquot sum that is less than the original number
#Negative numbers must raise a StandardError
#The classify method must be an instance method

#Examples/Test Case

#Data Structure
#input: Integer
#output: string
#intermediate:
  #create an array of the numbers that are evenly divisible (excluding the target num)
  #sum the array
  #if it's less than the target number, it's deficient
  #if it's the same, it's perfect
  #if it's greater than, it's abundant

#Algorithm
  #create an array of the numbers that are evenly divisible (excluding the target num)
    #helper method evenly_divisible_nums
      #make an empty array
      #make a range from 1 to the target number, excluding
      #loop through each number in the range
      #if it evenly divides on the target number, add to the array
  #sum the array
  #if it's less than the target number, it's deficient
  #if it's the same, it's perfect
  #if it's greater than, it's abundant

class PerfectNumber

  def self.get_evenly_divisible_nums(target_number)
    arr = []
    potentially_valid_nums = (1...target_number)

    potentially_valid_nums.each do |num|
      arr << num if target_number % num == 0
    end
    
    arr
  end

  def self.determine_number_status(sum, target_num)
    return "perfect" if sum == target_num
    return "deficient" if sum < target_num
    return "abundant" if sum > target_num
  end

  def self.classify(num)
    if num < 0
      raise StandardError
    else
      return "deficient" if get_evenly_divisible_nums(num).length == 1
      aliquot_sum = get_evenly_divisible_nums(num).sum
    end

    determine_number_status(aliquot_sum, num)
  end
end