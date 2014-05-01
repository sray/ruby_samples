#!/usr/bin/ruby
puts "Hello, Haeckse"
puts "It is now #{Time.now}"

def say_gn(name)
  result = "Good night, " + name
  result = "#{result}.capitalize\n:)"
  #return result
end

puts say_gn("Jo")
puts say_gn("Bob")
