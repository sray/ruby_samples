File.open("testfile") do |file|
  file.each_byte { |byte| print "#{byte.chr}" }
end

File.open("testfile") do |file|
  file.each_line { |line| puts "Got: #{line.dump}" }
end

File.open("testfile") do |file|
  file.each_line(".") { |line| puts "Got: #{line.dump}" }
end

IO.foreach("testfile") { |line| puts line  }

str = IO.read("testfile")
puts str.inspect

arr = IO.readlines("testfile")
puts arr.length
puts arr[0]

File.open("output.txt","w") do |file|
  file.puts "Hello"
  file.puts "1 + 2 = #{1+2}"
end

puts File.read("output.txt")

#streams
str1 = "\001\002\003"
str2 = ""
str2 << 1 << 2 << 3
puts str1.inspect
puts str2.inspect
puts [1,2,3].pack("c*").inspect

require 'stringio'
ip = StringIO.new("now is\nthe time\n")
op=StringIO.new("","w")
ip.each_line do |line|
  op.puts line.reverse
end
puts op.string.inspect