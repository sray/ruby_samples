printf( "Number: %5.2f,\nString: %s\n",1.23,"hi")

class File
  def File.open_and_process(*args)
    f = File.open(*args)
    yield f
    f.close()
  end
end

File.open_and_process("lib/testfile","r") do | file|
  while line = file.gets
    puts line
  end
end
puts "---using_with_index_method---"
File.open_and_process("lib/testfile","r") do |file|
  #file.each.with_index ^= file.each_with_index
  file.each_with_index do |line, index|
    puts " #{index}: "+line
  end
end