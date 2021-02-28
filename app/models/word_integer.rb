class WordInteger
    class << self
        @@number_names = 
        {
            1 => "one",
            2 => "two",
            3 => "three",
            4 => "four",
            5 => "five",
            6 => "six",
            7 => "seven",
            8 => "eight",
            9 => "nine",
            10 => "ten",
            11 => "eleven",
            12 => "twelve",
            13 => "thirteen",              
            14 => "fourteen",
            15 => "fifteen",
            16 => "sixteen",
            17 => "seventeen", 
            18 => "eighteen",
            19 => "nineteen",
            20 => "twenty",
            30 => "thirty",
            40 => "forty",
            50 => "fifty",
            60 => "sixty",
            70 => "seventy",
            80 => "eighty",
            90 => "ninety",
            100 => "hundred",
            1000 => "thousand",
            1000000 => "million",
            1000000000 => "billion",
            1000000000000 => "trillion"
        }

        def from_integer int
            return "zero" if int == 0
            word_representation_accumulator = []
            number_digits_reversed = int.to_s.reverse
            digit_count = 0
            number_digits_reversed.chars.each_with_index do |digit, index|
              digit_as_number = Integer(digit)
              skip_zero(digit_as_number) do 
                if digit_count == 0
                  word_representation_accumulator << "#{@@number_names[digit_as_number]}"
                elsif ten_to_twenty?(digit_as_number, digit_count)
                  backtrack word_representation_accumulator
                  actual_number = Integer("#{digit}#{number_digits_reversed[index - 1]}")
                  multiplier = (digit_count > 1 ? 10**(digit_count - 1) : nil)
                  word_representation = "#{@@number_names[actual_number]}"
                  word_representation += " #{@@number_names[multiplier]}" if multiplier
                  word_representation += " and" if word_representation_accumulator.size == 1
                  word_representation_accumulator << word_representation
                elsif twenty_to_one_hundred?(digit_count)
                  backtrack word_representation_accumulator 
                  multiplier = (digit_count > 1 ? 10**(digit_count - 1) : nil)
                  lookup_number = digit_as_number * 10
                  word_representation = "#{@@number_names[lookup_number]}"
                  word_representation += " #{@@number_names[Integer(number_digits_reversed[index - 1])]}"
                  word_representation += " #{@@number_names[multiplier]}" if multiplier
                  word_representation += " and" if word_representation_accumulator.size == 1
                  word_representation_accumulator << word_representation
                elsif digit_count == 2 || digit_count % 3 == 2
                  multiplier = 10**2
                  word_representation = "#{@@number_names[digit_as_number]} #{@@number_names[multiplier]}"
                  word_representation += " and" if word_representation_accumulator.size != 0
                  word_representation_accumulator << word_representation
                else
                  multiplier = 10**digit_count
                  word_representation = "#{@@number_names[digit_as_number]} #{@@number_names[multiplier]}"
                  word_representation += " and" if word_representation_accumulator.size == 1
                  word_representation_accumulator << word_representation
                end
              end
              digit_count += 1
            end
            show_literal word_representation_accumulator
        end

        def skip_zero(digit)
            if digit != 0
                yield
            end
        end

        def backtrack(word_list)
            word_list.pop
        end
      
        def ten_to_twenty?(digit_as_number, digit_count)
            (digit_count - 1) % 3 == 0 && digit_as_number == 1
        end
      
        def twenty_to_one_hundred?(digit_count)
            (digit_count - 1) % 3 == 0
        end

        def show_literal word_representation_accumulator
            literal = word_representation_accumulator.reverse.join(" ").gsub("thousand ", "thousand, ")
        end
    end
end