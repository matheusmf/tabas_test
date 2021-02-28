require "test_helper"

class WordIntegerTest < ActiveSupport::TestCase

    test "should 0 converted to zero" do
        assert "zero" == WordInteger.from_integer(0)
    end

    test "should 1 converted to 1" do
        assert "one" == WordInteger.from_integer(1)
    end

    test "should 21 converted to twenty one" do
        assert "twenty one" == WordInteger.from_integer(21)
    end

    test "should 105 converted to one hundred and five" do
        assert "one hundred and five" == WordInteger.from_integer(105)
    end

    test "should 1317 converted to one thousand, three hundred and seventeen" do
        assert "one thousand, three hundred and seventeen" == WordInteger.from_integer(1317)
    end

end