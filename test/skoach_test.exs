defmodule SkoachTest do
  use ExUnit.Case
  doctest Skoach

  describe "justify one line only" do
    test "one word in line is right justified" do
      assert Skoach.justify_line(["abc"], 3) == "abc"
      assert Skoach.justify_line(["abc"], 4) == " abc"
      assert Skoach.justify_line(["abc"], 5) == "  abc"
    end

    test "spaces evenly distributed" do
      assert Skoach.justify_line(["ab", "c"], 4) == "ab c"
      assert Skoach.justify_line(["ab", "c"], 5) == "ab  c"
      assert Skoach.justify_line(["ab", "c"], 6) == "ab   c"

      assert Skoach.justify_line(["ab", "c", "d"], 6) == "ab c d"
      assert Skoach.justify_line(["ab", "c", "d"], 8) == "ab  c  d"
    end

    test "extra spaces distributed right first" do
      assert Skoach.justify_line(["ab", "c", "d"], 7) == "ab c  d"
      assert Skoach.justify_line(["ab", "c", "d"], 9) == "ab  c   d"

      assert Skoach.justify_line(["ab", "c", "d", "e"], 9) == "ab c d  e"
      assert Skoach.justify_line(["ab", "c", "d", "e"], 10) == "ab c  d  e"
    end
  end

  describe "provided examples" do
    test "Example 1" do
      words = ["This", "is", "an", "example", "of", "text", "justification."]
      max_width = 16

      assert Skoach.justify(words, max_width) ==
               [
                 "This    is    an",
                 "example of  text",
                 "  justification."
               ]
    end

    test "Example 2" do
      words = ["What", "must", "be", "acknowledgment", "shall", "be"]
      max_width = 16

      assert Skoach.justify(words, max_width) ==
               [
                 "What   must   be",
                 "  acknowledgment",
                 "        shall be"
               ]

      # Note that the last line is "    shall be" instead of "shall     be",
      # because the last line must be right-justified instead of fully-justified.
      # Note that the second line is also right-justified becase it contains only one word.
    end

    test "Example 3" do
      words = [
        "Science",
        "is",
        "what",
        "we",
        "understand",
        "well",
        "enough",
        "to",
        "explain",
        "to",
        "a",
        "computer.",
        "Art",
        "is",
        "everything",
        "else",
        "we",
        "do"
      ]

      max_width = 20

      assert Skoach.justify(words, max_width) ==
               [
                 "Science is  what  we",
                 "understand      well",
                 "enough to explain to",
                 "a computer.  Art  is",
                 "everything  else  we",
                 "                  do"
               ]
    end
  end
end
