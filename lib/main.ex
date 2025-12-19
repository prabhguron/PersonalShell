

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



"cd" ->

  path = Enum.join(args, " ")

  case File.cd(path) do

  :ok ->
    IO.write("$ ")
  print_multiple_times(msg, n + 1)

  {error, _reason} ->

  IO.puts("cd #{path}: No such file or directory")
    
    IO.write("$ ")
  print_multiple_times(msg, n + 1)

  end





"pwd" ->
IO.puts(File.cwd!())
   IO.write("$ ")
  print_multiple_times(msg, n + 1)


    "echo" ->
IO.puts(Enum.join(args, " "))
        IO.write("$ ")
    print_multiple_times(msg, n + 1)


  "exit" ->
    IO.puts("exit")

  "type" ->
  case args do

    ["pwd"] ->
    IO.puts("#{Enum.join(args, " ")} is a shell builtin")
        IO.write("$ ")

        print_multiple_times(msg, n + 1)
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
         IO.puts("#{cmd} not found")
        IO.write("$ ")
        print_multiple_times(msg, n + 1)  
        end




  _ ->


      IO.puts("#{Enum.join(args, " ")} not found")
          IO.write("$ ")
          print_multiple_times(msg, n + 1)

      end



  _ ->


file = System.find_executable(user_command)

if file do


  System.cmd(file, args, into: IO.stream(), arg0: user_command)
else
  IO.puts("#{user_input}: command not found")
end
        
     IO.write("$ ")
    print_multiple_times(msg, n + 1)

end

  end
  end

