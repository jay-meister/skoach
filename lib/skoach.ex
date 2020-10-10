defmodule Skoach do
  def justify(words, max_width) do
    do_justify([], words, max_width)
  end

  # do_justify steps through the list, checking if current_line_words is sufficient
  # to fill a line.
  # If so, we justify it, and move onto the next word, setting current_line_words to []

  defp do_justify(current_line_words, [], max_width),
    do: [justify_line_right(current_line_words, max_width)]

  defp do_justify(current_line_words, [next_word | tail], max_width) do
    with_next_word = current_line_words ++ [next_word]

    if Enum.join(with_next_word, " ") |> String.length() > max_width do
      [
        justify_line(current_line_words, max_width) | do_justify([next_word], tail, max_width)
      ]
    else
      do_justify(with_next_word, tail, max_width)
    end
  end

  def justify_line([word], max_width) do
    justify_line_right([word], max_width)
  end

  def justify_line(words, max_width) do
    gaps = length(words) - 1
    char_length = Enum.join(words) |> String.length()

    shared_spaces = div(max_width - char_length, gaps) |> build_pad()

    extra_spaces = rem(max_width - char_length, gaps)

    distribute_extra_spaces([], Enum.reverse(words), extra_spaces)
    |> Enum.join(shared_spaces)
  end

  # distribute remainder spaces towards right side of line
  defp distribute_extra_spaces(with_spaces, [], 0), do: with_spaces

  defp distribute_extra_spaces(with_spaces, [word | tail], extra_spaces) do
    if extra_spaces > 0 do
      distribute_extra_spaces([" #{word}" | with_spaces], tail, extra_spaces - 1)
    else
      distribute_extra_spaces([word | with_spaces], tail, extra_spaces)
    end
  end

  defp justify_line_right(words, max_width) do
    Enum.join(words, " ")
    |> String.pad_leading(max_width)
  end

  defp build_pad(n) when n > 0 do
    Enum.reduce(1..n, "", fn _, acc -> acc <> " " end)
  end
end
