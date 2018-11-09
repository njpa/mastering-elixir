defmodule GuessingGame do
  # user to guess a number between a low number and a high number
  # provided by the guessing game
  # tell user our guess
  # if user says "yes" -> 
  #   game over
  # if user says "bigger" 
  #   bigger(low, high)
  # if user says "smaller" 
  #   smaller(low, high)
  # anything else -> tell user to enter a valid response
  def main do
    IO.gets("Think up a number... [enter when ready]")
    IO.gets("Think up a range encompassing that number... [enter when ready]")
    bottom_data = IO.gets("Give me the bottom end of that range: ")
    top_data = IO.gets("Now give me the top end of the range: ")
    bottom = integer_from_gets(bottom_data)
    top = integer_from_gets(top_data)
    guess(bottom, top)
  end

  def guess(bottom, top) do
    IO.puts("My guess is that your number is #{mid(bottom, top)}")
    IO.puts("Is this it? [type 'y'], is it bigger? ['b'], smaller? ['s']")

    direction =
      IO.gets("")
      |> String.trim("\n")

    case direction do
      "y" -> IO.puts("Got it!")
      "s" -> guess(bottom, new_top(bottom, top))
      "b" -> guess(new_bottom(bottom, top), top)
      _ -> guess(bottom, top)
    end
  end

  def integer_from_gets(io_string) do
    io_string
    |> String.trim("\n")
    |> String.to_integer()
  end

  def mid(bottom, top) do
    div(bottom + top, 2)
  end

  def new_top(bottom, top) do
    max(bottom, mid(bottom, top) - 1)
  end

  def new_bottom(bottom, top) do
    min(top, mid(bottom, top) + 1)
  end
end
