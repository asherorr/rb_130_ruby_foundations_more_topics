# PEDAC

#Problem:
#build a singly linked list using two classes: Element and SimpleLinkedList.
#the linked list should support adding elements, removing elements, peeking at the head,
#converting to/from arrays, and reversing the list.

#implicit requirements:
  #in #push, ensure the head is always at index 0.
  #each new Element has its @next set to the previous head (from @list[0]).
  #reversal is handled by creating a new SimpleLinkedList and re-pushing each datum from original list.
  #from_a uses reverse on the array to preserve correct ordering in push.

#Example/Test Cases

#Data Structure

# Element class:
#should store:
#   @datum: the value stored in the node
#   @next: reference to the next Element (or nil if it's the tail)
#methods needed:
#   #datum => returns the value stored
#   #next => returns the next element
#   #tail? => returns true if this is the last element (i.e., @next is nil)

# SimpleLinkedList class:
# should store:
#   @list: an array of Element objects, where index 0 is the head
# methods needed:
#  #initialize => sets up @list as an empty array
#   #size => returns the number of elements in the list (via @list.size)
#   #empty? => returns true if the list has no elements
#   #push(value) => creates a new Element and adds it to the head (index 0),
#                   with @next pointing to the previous head
#   #peek => returns the datum of the head element without removing it
#   #head => returns the first Element object in @list
#   #pop => removes and returns the datum of the head element
#   .from_a(array) => builds a SimpleLinkedList from an array (handles nil and empty arrays)
#   #to_a => returns an array of the datums from the linked list
#   #reverse => returns a new SimpleLinkedList with the elements in reverse order

class Element
  attr_accessor :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :list, :head

  def initialize
    @list = []
    @head = nil
  end

  def size
    self.list.size
  end

  def empty?
    self.list.empty?
  end

  def push(arg)
    new_element = Element.new(arg, self.head)
    list.unshift(new_element)
  end

  def peek
    return nil if list.empty?
    self.list[0].datum
  end

  def head
    list[0]
  end

  def pop
    return nil if list.empty?
    list.shift.datum
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil?

    array.reverse.each do |datum|
      list.push(datum)
    end

    list
  end

  def to_a
    new_arr = []

    self.list.each do |ele|
      new_arr.push(ele.datum)
    end

    return new_arr
  end

 def reverse
  final_list = SimpleLinkedList.new
  self.list.each do |element|
    final_list.push(element.datum)
  end
  final_list
end

end

