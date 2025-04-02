class RomanNumeral
  CONVERSION = {
    1 => ["I", "X", "C", "M"],
    2 => ["II", "XX", "CC", "MM"],
    3 => ["III", "XXX", "CCC", "MMM"],
    4 => ["IV", "XL", "CD"],
    5 => ["V", "L", "D"],
    6 => ["VI", "LX", "DC"],
    7 => ["VII", "LXX", "DCC"],
    8 => ["VIII", "LXXX", "DCCC"],
    9 => ["IX", "XC", "CM"],
    0 => ""
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    number_reversed = @number.digits

    roman_numerals_array = number_reversed.map.with_index do |digit, idx|
      CONVERSION[digit][idx]
    end

    roman_numerals_array.reverse.join
  end
end