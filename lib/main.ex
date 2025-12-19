

defmodule CLI do
  def main(_args) do
    # TODO: Uncomment the code below to pass the first stage
        
      IO.write("$ ")
    Recursion.print_multiple_times("user_input", 1)

  end
end

defmodule Recursion do
  def print_multiple_times(msg, n) when n > 0 do
    user_input = IO.gets("") |> String.trim()
    

    #splits into list and first list is user command rest args


    [user_command | args] = String.split(user_input)






#checks user command
case user_command do
    "echo" ->
IO.puts(Enum.join(args, " "))
        IO.write("$ ")
    print_multiple_times(msg, n + 1)



  "exit" ->
    IO.puts("exit")

  "type" ->
  case args do

  ["echo"] ->
    IO.puts("#{Enum.join(args, " ")} is a shell builtin")
        IO.write("$ ")

        print_multiple_times(msg, n + 1)


  ["exit"] ->
    IO.puts("#{Enum.join(args, " ")} is a shell builtin")
        IO.write("$ ")

        print_multiple_times(msg, n + 1)
  ["type"] ->
    IO.puts("#{Enum.join(args, " ")} is a shell builtin")
        IO.write("$ ")

        print_multiple_times(msg, n + 1)

   [cmd] ->
  result = System.find_executable(cmd)

    if result do 

       IO.puts("#{cmd} is #{System.find_executable(cmd)}")
        IO.write("$ ")
        print_multiple_times(msg, n + 1)

        else 
         IO.puts("#{cmd} is not found")
        IO.write("$ ")
        print_multiple_times(msg, n + 1)  
        end




  _ ->
      IO.puts("#{Enum.join(args, " ")} not found")
          IO.write("$ ")
          print_multiple_times(msg, n + 1)

      end



  _ ->
    IO.puts("#{user_input}: command not found")
    IO.write("$ ")
    print_multiple_times(msg, n + 1)
end

  end
  end

