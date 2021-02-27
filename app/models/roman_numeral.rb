class RomanNumeral
    MAX = 3999

    @@roman_mapping =
    {
        1 => "I",
        4 => "IV",
        5 => "V",
        9 => "IX",
        10 => "X",
        40 => "XL",
        50 => "L",
        90 => "XC",
        100 => "C",
        400 => "CD",
        500 => "D",
        900 => "CM",
        1000 => "M"
    }

    def self.from_integer int
        return nil if int < 0 || int > MAX
        remainder = int
        result = ''
        @@roman_mapping.keys.sort.reverse.each do |digit_value|
            while remainder >= digit_value
                remainder -= digit_value
                result += @@roman_mapping[digit_value]
            end
            break if remainder <= 0
        end
        result
    end

end