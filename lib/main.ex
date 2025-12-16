defmodule CLI do
  def main(_args) do
    # TODO: Uncomment the code below to pass the first stage
     IO.write("$ ")
    user_input = IO.gets("") |> String.trim()
    IO.puts("#{user_input}: command not found ")




     

  end
end
