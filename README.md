# Text Justification Module

Given an array/list of `words` and a width `max_width`, format the text such that each line has exactly `max_width` characters and is fully (left and right) justified.

- pack words in a greedy approach; that is, pack as many words as you can in each line. 
- pad extra spaces `' '` when necessary so that each line has exactly `max_width` characters.
- extra spaces between words are distributed as evenly as possible. 
- if the number of spaces on a line do not divide evenly between words, the empty slots on the right will be assigned more spaces than the slots on the left.
- the last line of text is always right justified and no extra space is inserted between words.

    Note:

    * Each word's length is guaranteed to be greater than 0 and not exceed max_width.
    * The input array words contains at least one word.

##### Example:

```elixir
# Input:
words = ["This", "is", "an", "example", "of", "text", "justification."]
max_width = 16

# Output:
[
   "This    is    an",
   "example of  text",
   "  justification."
]
```


## Run tests

```
clone repp 
cd skoach
mix test
```


