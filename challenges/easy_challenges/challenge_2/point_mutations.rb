class DNA
  attr_reader :original_strand

  def initialize(original_strand)
    @original_strand = original_strand
  end

  def hamming_distance(test_strand)
    distance = 0
    minimum_size = [original_strand.length, test_strand.length].min

    (0...minimum_size).each do |idx|
      distance += 1 if original_strand.chars[idx] != test_strand.chars[idx]
    end

    distance
  end
end