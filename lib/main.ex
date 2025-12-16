

defmodule CLI do
  def main(_args) do
    # TODO: Uncomment the code below to pass the first stage

    Recursion.print_multiple_times("user_input", 1)

  end
end

defmodule Recursion do
  def print_multiple_times(msg, n) when n > 0 do

    user_input = IO.gets("") |> String.trim()

     IO.puts("#{user_input}: command not found ")
     IO.write("$")

      print_multiple_times(msg, n + 1)

  end
  end

