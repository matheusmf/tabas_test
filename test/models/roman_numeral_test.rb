require "test_helper"

class RomanNumeralTest < ActiveSupport::TestCase

    test "should 1 converted to I" do
        assert "I" == RomanNumeral.from_integer(1)
    end

    test "should 2 converted to II" do
        assert "II" == RomanNumeral.from_integer(2)
    end

    test "should 4 converted to IV" do
        assert "IV" == RomanNumeral.from_integer(4)
    end

    test "should 5 converted to V" do
        assert "V" == RomanNumeral.from_integer(5)
    end

    test "should 9 converted to IX" do
        assert "IX" == RomanNumeral.from_integer(9)
    end

    test "should 10 converted to X" do
        assert "X" == RomanNumeral.from_integer(10)
    end

    test "should 526 converted to DXXVI" do
        assert "DXXVI" == RomanNumeral.from_integer(526)
    end

    test "should 2789 converted to MMDCCLXXXIX" do
        assert "MMDCCLXXXIX" == RomanNumeral.from_integer(2789)
    end

    test "should 3999 converted to MMMCMXCIX" do
        assert "MMMCMXCIX" == RomanNumeral.from_integer(3999)
    end

end