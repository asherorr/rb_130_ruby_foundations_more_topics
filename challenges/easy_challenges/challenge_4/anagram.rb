class Anagram
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def chars
    @word.chars
  end

  def length
    @word.length
  end

  def ==(other)
    self.word == other
  end

  def match(list_of_possible_anagrams)
    list_of_possible_anagrams.select do |word|
      self.is_anagram?(word)
    end
  end

  def build_hash_of_letters(word)
    #build hash
    hash = {}
    word.downcase.chars.each do |letter|
      hash[letter] = 0
    end

    #increment by one
    word.downcase.chars.each do |letter|
      hash[letter] += 1
    end

    hash
  end

  def is_anagram?(other)
    return false if self.word.downcase == other.downcase
    return false if self.word.length != other.length
  
    hash1 = build_hash_of_letters(self.word)
    hash2 = build_hash_of_letters(other)

    hash1 == hash2
    # self_frequency = self.word.downcase.chars.each_with_object(Hash.new(0)) { |char, hash| hash[char] += 1 }
    # other_frequency = other.downcase.chars.each_with_object(Hash.new(0)) { |char, hash| hash[char] += 1 }
    # self_frequency == other_frequency
  end
end
